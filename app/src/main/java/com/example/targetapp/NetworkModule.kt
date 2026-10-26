package com.example.targetapp

import okhttp3.CertificatePinner
import okhttp3.OkHttpClient
import okhttp3.Request

class NetworkModule {

    private fun getOkHttpClient(): OkHttpClient {
        // Cấu hình OkHttp CertificatePinner
        val certificatePinner = CertificatePinner.Builder()
            .add("httpbin.org", "sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=") // Hash giả lập để kích hoạt lỗi Pinning
            .build()

        return OkHttpClient.Builder()
            .certificatePinner(certificatePinner)
            .build()
    }

    fun makePinnedRequest(url: String, onResult: (Boolean, String) -> Unit) {
        val client = getOkHttpClient()
        val request = Request.Builder().url(url).build()

        Thread {
            try {
                val response = client.newCall(request).execute()
                val body = response.body?.string() ?: "Empty Response"
                onResult(true, body)
            } catch (e: Exception) {
                // SSL Pinning chặn thành công sẽ nhảy vào catch này
                onResult(false, "SSL Pinning Check Failed: ${e.message}")
            }
        }.start()
    }
}