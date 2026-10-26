package com.example.targetapp

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    private val networkModule = NetworkModule()

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
            tvStatus.text = if (isRooted) "Cảnh báo: Thiết bị ĐÃ BỊ ROOT!" else "Thiết bị An toàn (Not Rooted)"
        }

        // 2. Kiểm tra SSL Pinning Network
        btnTestNetwork.setOnClickListener {
            tvStatus.text = "Đang gởi request kiểm tra SSL Pinning..."
            networkModule.makePinnedRequest("https://httpbin.org/get") { success, message ->
                runOnUiThread {
                    tvStatus.text = if (success) "Kết nối thành công!\n$message" else "Chặn bởi SSL Pinning:\n$message"
                }
            }
        }

        // 3. Mở Module WebView Lỗ hổng
        btnOpenWebView.setOnClickListener {
            val intent = Intent(this, VulnerableWebViewActivity::class.java)
            intent.putExtra("TARGET_URL", "https://httpbin.org/get")
            startActivity(intent)
        }
    }
}