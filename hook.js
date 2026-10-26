Java.perform(function () {
    console.log("\n==================================================");
    console.log("[+] KÍCH HOẠT DYNAMIC REFLECTION & UNIVERSAL HOOK");
    console.log("==================================================\n");

    // ---------------------------------------------------------
    // 1. BYPASS ROOT CHECK (HOOK CẢ ROOTDETECTION VÀ MAINACTIVITY)
    // ---------------------------------------------------------
    try {
        var RootDetection = Java.use("com.example.targetapp.RootDetection");
        var rootMethods = RootDetection.class.getDeclaredMethods();
        rootMethods.forEach(function (method) {
            var mName = method.getName();
            try {
                RootDetection[mName].overloads.forEach(function (overload) {
                    overload.implementation = function () {
                        console.log("[>>>] BYPASS ROOT: Executed RootDetection." + mName + "() -> Forced FALSE");
                        return false;
                    };
                });
            } catch (e) {}
        });
    } catch (e) {
        console.log("[-] RootDetection Hook Notice: " + e);
    }

    // Intercept trực tiếp MainActivity để chống Kotlin Inlining
    try {
        var MainActivity = Java.use("com.example.targetapp.MainActivity");
        var mainMethods = MainActivity.class.getDeclaredMethods();
        mainMethods.forEach(function (method) {
            var mName = method.getName();
            if (mName.toLowerCase().indexOf("root") !== -1) {
                MainActivity[mName].overloads.forEach(function (overload) {
                    overload.implementation = function () {
                        console.log("[>>>] BYPASS ROOT (MainActivity Inlined): " + mName + "() intercepted");
                        return false;
                    };
                });
            }
        });
    } catch (e) {}

    // ---------------------------------------------------------
    // 2. BYPASS SSL PINNING TẦNG HỆ THỐNG (SSLCONTEXT UNIVERSAL)
    // ---------------------------------------------------------
    try {
        var TrustManager = Java.use("javax.net.ssl.X509TrustManager");
        var SSLContext = Java.use("javax.net.ssl.SSLContext");

        // Tạo TrustManager tin tưởng mọi chứng chỉ SSL
        var CustomTrustManager = Java.registerClass({
            name: "com.example.targetapp.UniversalTrustManager",
            implements: [TrustManager],
            methods: {
                checkClientTrusted: function (chain, authType) {},
                checkServerTrusted: function (chain, authType) {},
                getAcceptedIssuers: function () { return []; }
            }
        });

        // Bắt mọi khởi tạo SSLContext.init và ép dùng CustomTrustManager
        SSLContext.init.overload(
            '[Ljavax.net.ssl.KeyManager;',
            '[Ljavax.net.ssl.TrustManager;',
            'java.security.SecureRandom'
        ).implementation = function (keyManager, trustManager, secureRandom) {
            console.log("[>>>] BYPASS SSL PINNING: SSLContext.init() intercepted -> Injecting Universal TrustManager");
            this.init(keyManager, [CustomTrustManager.$new()], secureRandom);
        };
        console.log("[+] Universal SSLContext Hook Ready!");
    } catch (e) {
        console.log("[-] SSLContext Hook Error: " + e);
    }

    // ---------------------------------------------------------
    // 3. BYPASS OKHTTP 4.X INTERNAL METHODS (REFLECTION SCAN)
    // ---------------------------------------------------------
    try {
        var CertificatePinner = Java.use("okhttp3.CertificatePinner");
        var pinnerMethods = CertificatePinner.class.getDeclaredMethods();

        pinnerMethods.forEach(function (method) {
            var mName = method.getName();
            // Hook tất cả phương thức có chứa từ 'check' hoặc 'find' (kể cả hàm internal của Kotlin)
            if (mName.indexOf("check") !== -1 || mName.indexOf("find") !== -1) {
                CertificatePinner[mName].overloads.forEach(function (overload) {
                    overload.implementation = function () {
                        console.log("[>>>] BYPASS OKHTTP 4: CertificatePinner." + mName + "() intercepted!");
                        // Nếu hàm trả về List (findMatchingPins) thì trả về danh sách rỗng, ngược lại return void
                        if (method.getReturnType().getName().indexOf("List") !== -1) {
                            var Collections = Java.use("java.util.Collections");
                            return Collections.emptyList();
                        }
                        return;
                    };
                });
            }
        });
        console.log("[+] Dynamic OkHttp 4.x Reflection Hook Ready!");
    } catch (e) {
        console.log("[-] OkHttp Reflection Error: " + e);
    }
});