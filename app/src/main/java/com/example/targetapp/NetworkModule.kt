package com.example.targetapp

import okhttp3.CertificatePinner
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.IOException
import java.net.SocketTimeoutException
import java.net.UnknownHostException
import java.security.cert.X509Certificate
import java.util.UUID
import javax.net.ssl.SSLException
import javax.net.ssl.SSLPeerUnverifiedException

class NetworkModule(private val certificate: X509Certificate) {
    fun makePinnedRequest(wrongPin: Boolean, onResult: (String) -> Unit) {
        val id = UUID.randomUUID().toString()
        Thread {
            val pin = if (wrongPin) {
                "sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
            } else {
                CertificatePinner.pin(certificate)
            }
            val client = OkHttpClient.Builder()
                .certificatePinner(CertificatePinner.Builder().add("localhost", pin).build())
                .followRedirects(false)
                .build()
            val request = Request.Builder().url("https://localhost:8443/probe")
                .header("X-Lab-Request", id).build()
            val result = try {
                client.newCall(request).execute().use { response ->
                    when {
                        !response.isSuccessful -> "HTTP ${response.code}"
                        response.body.string() != id -> "HTTP ${response.code}, sai mã phản hồi"
                        else -> "HTTP ${response.code}, máy chủ đã xác nhận mã"
                    }
                }
            } catch (e: IOException) {
                val kind = when (e) {
                    is SSLPeerUnverifiedException -> "Xác minh máy chủ hoặc pin"
                    is SSLException -> "TLS"
                    is UnknownHostException -> "DNS"
                    is SocketTimeoutException -> "Hết thời gian chờ"
                    else -> "Kết nối hoặc đọc dữ liệu"
                }
                "$kind · ${e.javaClass.simpleName}\n${e.message.orEmpty().take(350)}"
            }
            onResult("ID $id\nPin app đã chọn: $pin\n$result")
        }.start()
    }
}
