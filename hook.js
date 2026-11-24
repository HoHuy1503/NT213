/*
 * TargetApp_Lab (com.example.targetapp) - local, authorized Frida lab.
 * Bypass app RootDetection + OkHttp CertificatePinner without changing wrongPin=true.
 * Diagnostic goal: distinguish INSTALLED hooks from HIT hooks.
 * Frida 17.x / Android.
 */
'use strict';

Java.perform(function () {
    function log(message) {
        console.log('[TARGET-LAB] ' + message);
    }
    function fail(target, error) {
        log('[ERROR] ' + target + ': ' + String(error));
    }

    try {
        var Process = Java.use('android.os.Process');
        log('[SESSION] Frida is inside PID=' + Process.myPid());
    } catch (e) {
        fail('read PID', e);
    }

    // Verify that this is the activity currently being interacted with.
    try {
        var Activity = Java.use('android.app.Activity');
        var originalOnResume = Activity.onResume.overload();
        originalOnResume.implementation = function () {
            try {
                if (String(this.getClass().getName()) === 'com.example.targetapp.MainActivity') {
                    log('[HIT][ACTIVITY] TargetApp_Lab MainActivity resumed');
                }
            } catch (_) {}
            return originalOnResume.call(this);
        };
        log('[INSTALLED] Activity.onResume() monitor');
    } catch (e) {
        fail('Activity monitor', e);
    }

    // 1) Root check: keep this narrow to the application's own check.
    try {
        var RootDetection = Java.use('com.example.targetapp.RootDetection');
        var rootCheck = RootDetection.isDeviceRooted.overload();
        rootCheck.implementation = function () {
            log('[HIT][ROOT] isDeviceRooted() => false');
            return false;
        };
        log('[INSTALLED] RootDetection.isDeviceRooted()');
    } catch (e) {
        fail('RootDetection', e);
    }

    // 1b) Root checks used by RootDetection.kt. R8 can inline the aggregate
    // isDeviceRooted() call, so cover the component checks as well.
    try {
        var RD = Java.use('com.example.targetapp.RootDetection');
        ['checkSuPaths', 'checkBuildTags', 'checkSuCommand'].forEach(function (methodName) {
            try {
                var original = RD[methodName].overload();
                original.implementation = function () {
                    log('[HIT][ROOT-COMPONENT] ' + methodName + '() => false');
                    return false;
                };
                log('[INSTALLED] RootDetection.' + methodName + '()');
            } catch (e) {
                fail('RootDetection.' + methodName, e);
            }
        });
    } catch (e) {
        fail('RootDetection component hooks', e);
    }

    // Inlined Kotlin bytecode can call platform APIs directly, bypassing
    // the RootDetection Java hooks. Cover ONLY the exact checks in the lab.
    try {
        var File = Java.use('java.io.File');
        var originalExists = File.exists.overload();
        var suPaths = {
            '/system/app/Superuser.apk': true,
            '/sbin/su': true,
            '/system/bin/su': true,
            '/system/xbin/su': true,
            '/data/local/x/su': true,
            '/data/local/bin/su': true,
            '/system/sd/xbin/su': true,
            '/system/bin/failsafe/su': true,
            '/data/local/su': true
        };
        originalExists.implementation = function () {
            var path = String(this.getAbsolutePath());
            if (Object.prototype.hasOwnProperty.call(suPaths, path)) {
                log('[HIT][ROOT-FILE] File.exists(' + path + ') => false');
                return false;
            }
            return originalExists.call(this);
        };
        log('[INSTALLED] java.io.File.exists() for lab su paths only');
    } catch (e) {
        fail('File.exists', e);
    }

    try {
        var Runtime = Java.use('java.lang.Runtime');
        var execArray = Runtime.exec.overload('[Ljava.lang.String;');
        var IOException = Java.use('java.io.IOException');
        execArray.implementation = function (cmd) {
            if (cmd && cmd.length === 2 &&
                String(cmd[0]) === '/system/xbin/which' && String(cmd[1]) === 'su') {
                log('[HIT][ROOT-CMD] which su => simulated not found');
                throw IOException.$new('which su unavailable (lab hook)');
            }
            return execArray.call(this, cmd);
        };
        log('[INSTALLED] Runtime.exec(String[]) for exact which su command');
    } catch (e) {
        fail('Runtime.exec', e);
    }

    try {
        var Build = Java.use('android.os.Build');
        var tagsBefore = String(Build.TAGS.value);
        log('[ROOT-BUILD] Build.TAGS before=' + tagsBefore);
        if (tagsBefore.indexOf('test-keys') !== -1) {
            Build.TAGS.value = tagsBefore.replace(/test-keys/g, 'release-keys');
        }
        var tagsAfter = String(Build.TAGS.value);
        log('[ROOT-BUILD] Build.TAGS after=' + tagsAfter);
        if (tagsAfter.indexOf('test-keys') !== -1) {
            log('[WARN][ROOT-BUILD] Build.TAGS was not changed; need to investigate remaining root check.');
        }
    } catch (e) {
        fail('Build.TAGS', e);
    }

    // 2) Monitor the real test argument WITHOUT modifying it.
    try {
        var NetworkModule = Java.use('com.example.targetapp.NetworkModule');
        var makePinnedRequest = NetworkModule.makePinnedRequest.overload(
            'boolean', 'kotlin.jvm.functions.Function1'
        );
        makePinnedRequest.implementation = function (wrongPin, onResult) {
            log('[HIT][PROBE] makePinnedRequest(wrongPin=' + wrongPin + ')');
            return makePinnedRequest.call(this, wrongPin, onResult);
        };
        log('[INSTALLED] NetworkModule.makePinnedRequest() monitor');
    } catch (e) {
        fail('NetworkModule', e);
    }

    // 3) Produce an EMPTY CertificatePinner by public Builder API.
    //    OkHttp 5's CertificatePinner.DEFAULT is not reliably exposed to Frida.
    //    Do not hook Builder.build() before producing this instance.
    var emptyPinner = null;
    try {
        var CertificatePinnerBuilder = Java.use('okhttp3.CertificatePinner$Builder');
        emptyPinner = CertificatePinnerBuilder.$new().build();
        log('[READY] Constructed empty CertificatePinner using Builder().build()');
    } catch (e) {
        fail('new empty CertificatePinner', e);
    }

    // 4) In this app, NetworkModule calls OkHttpClient.Builder.certificatePinner().
    //    Replace its argument with the empty CertificatePinner.
    if (emptyPinner !== null) {
        try {
            var OkHttpBuilder = Java.use('okhttp3.OkHttpClient$Builder');
            var setPinner = OkHttpBuilder.certificatePinner.overload('okhttp3.CertificatePinner');
            setPinner.implementation = function (requestedPinner) {
                log('[HIT][OKHTTP-BUILDER] Configured pin set replaced by empty pin set');
                return setPinner.call(this, emptyPinner);
            };
            log('[INSTALLED] OkHttpClient.Builder.certificatePinner()');
        } catch (e) {
            fail('OkHttpClient.Builder.certificatePinner()', e);
        }
    }

    // 5) Fallback for OkHttp versions that directly invoke a different pin check.
    try {
        var CertificatePinner = Java.use('okhttp3.CertificatePinner');
        ['check', 'check$okhttp'].forEach(function (name) {
            try {
                var group = CertificatePinner[name];
                if (!group) {
                    log('[INFO] CertificatePinner.' + name + ' not found');
                    return;
                }
                group.overloads.forEach(function (overload) {
                    var args = overload.argumentTypes.map(function (a) { return a.className; });
                    var signature = name + '(' + args.join(', ') + ')';
                    if (overload.returnType.className !== 'void') {
                        log('[SKIP] Non-void overload: ' + signature);
                        return;
                    }
                    overload.implementation = function () {
                        log('[HIT][PIN-CHECK] CertificatePinner.' + signature + ' -> bypass');
                        return;
                    };
                    log('[INSTALLED] CertificatePinner.' + signature);
                });
            } catch (e) {
                fail('CertificatePinner.' + name, e);
            }
        });
    } catch (e) {
        fail('CertificatePinner class', e);
    }

    // Some OkHttp variants check whether host has matching pins first.
    try {
        var Collections = Java.use('java.util.Collections');
        var CP = Java.use('okhttp3.CertificatePinner');
        var findMatchingPins = CP.findMatchingPins.overload('java.lang.String');
        findMatchingPins.implementation = function (hostname) {
            log('[HIT][FIND-PINS] ' + hostname + ' -> []');
            return Collections.emptyList();
        };
        log('[INSTALLED] CertificatePinner.findMatchingPins(String)');
    } catch (e) {
        log('[INFO] findMatchingPins fallback unavailable: ' + String(e));
    }

    log('[READY] Now tap ROOT, then WRONG PIN in the *same* running app.');
    log('[READY] If NO [HIT] lines appear, compare [SESSION] PID with adb shell pidof com.example.targetapp');
});