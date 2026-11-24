package com.example.targetapp

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    private val networkModule by lazy {
        resources.openRawResource(R.raw.lab_server).use {
            val cert = java.security.cert.CertificateFactory.getInstance("X.509")
                .generateCertificate(it) as java.security.cert.X509Certificate
            NetworkModule(cert)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btnCheckRoot = findViewById<Button>(R.id.btnCheckRoot)
        val btnTestNetwork = findViewById<Button>(R.id.btnTestNetwork)
        val btnOpenWebView = findViewById<Button>(R.id.btnOpenWebView)
        val tvStatus = findViewById<TextView>(R.id.tvStatus)

        // 1. Kiểm tra Root
        btnCheckRoot.setOnClickListener {
            val isRooted = RootDetection.isDeviceRooted()
            tvStatus.text = if (isRooted) "Phát hiện dấu hiệu root" else "Chưa phát hiện dấu hiệu root"
        }

        // 2. Kiểm tra SSL Pinning Network
        val btnWrongPin = findViewById<Button>(R.id.btnWrongPin)
        fun runProbe(wrongPin: Boolean) {
            btnTestNetwork.isEnabled = false
            btnWrongPin.isEnabled = false
            val mode = if (wrongPin) "Pin OkHttp sai" else "Pin hợp lệ"
            tvStatus.text = "$mode · Đang kết nối…"
            networkModule.makePinnedRequest(wrongPin) { result ->
                runOnUiThread {
                    if (!isDestroyed && !isFinishing) {
                        tvStatus.text = "$mode\n$result"
                        btnTestNetwork.isEnabled = true
                        btnWrongPin.isEnabled = true
                    }
                }
            }
        }
        btnTestNetwork.setOnClickListener { runProbe(false) }
        btnWrongPin.setOnClickListener { runProbe(true) }
        findViewById<Button>(R.id.btnSafeWebView).setOnClickListener {
            startActivity(Intent(this, SafeWebViewActivity::class.java))
        }

        // 3. Mở Module WebView Lỗ hổng
        btnOpenWebView.setOnClickListener {
            val intent = Intent(this, VulnerableWebViewActivity::class.java)
            intent.putExtra("TARGET_URL", "https://httpbin.org/get")
            startActivity(intent)
        }
    }
}

