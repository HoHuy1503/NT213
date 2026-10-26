package com.example.targetapp

import java.io.File

object RootDetection {

    // 1. Kiểm tra sự tồn tại của tệp su trên các đường dẫn phổ biến
    fun checkSuPaths(): Boolean {
        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/sbin/su",
            "/system/bin/su",
            "/system/xbin/su",
            "/data/local/x/su",
            "/data/local/bin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su"
        )
        return paths.any { File(it).exists() }
    }

    // 2. Kiểm tra nhãn BUILD_TAGS (test-keys từ ROM cook/emulator)
    fun checkBuildTags(): Boolean {
        val buildTags = android.os.Build.TAGS
        return buildTags != null && buildTags.contains("test-keys")
    }

    // 3. Thực thi thử lệnh which su qua Runtime
    fun checkSuCommand(): Boolean {
        var process: Process? = null
        return try {
            process = Runtime.getRuntime().exec(arrayOf("/system/xbin/which", "su"))
            val reader = process.inputStream.bufferedReader()
            reader.readLine() != null
        } catch (e: Exception) {
            false
        } finally {
            process?.destroy()
        }
    }

    // Kiểm tra tổng hợp trạng thái thiết bị
    fun isDeviceRooted(): Boolean {
        return checkSuPaths() || checkBuildTags() || checkSuCommand()
    }
}