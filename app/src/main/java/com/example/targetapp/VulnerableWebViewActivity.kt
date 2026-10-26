package com.example.targetapp

import android.annotation.SuppressLint
import android.os.Bundle
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class VulnerableWebViewActivity : AppCompatActivity() {

    private lateinit var webView: WebView

    // JS Bridge Object truyền dữ liệu hoặc cung cấp hàm thực thi cho JavaScript
    class WebAppInterface(private val activity: AppCompatActivity) {

        @JavascriptInterface
        fun showToast(message: String) {
            Toast.makeText(activity, message, Toast.LENGTH_SHORT).show()
        }

        @JavascriptInterface
        fun getAppAuthToken(): String {
            // Điểm rò rỉ dữ liệu nhạy cảm nếu trang web bị MitM chèn mã độc
            return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.SECRET_SESSION_TOKEN"
        }
    }

    @SuppressLint("SetJavaScriptEnabled", "JavascriptInterface")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        webView = WebView(this)
        setContentView(webView)

        // Cấu hình yếu (Vulnerable Settings)
        val settings = webView.settings
        settings.javaScriptEnabled = true
        settings.allowFileAccess = true

        // Cầu nối giao tiếp Java-JS
        webView.addJavascriptInterface(WebAppInterface(this), "AndroidBridge")
        webView.webViewClient = WebViewClient()

        // Lỗ hổng: Nhận URL từ Intent mở rộng không lọc domain/scheme
        val inputUrl = intent.getStringExtra("TARGET_URL") ?: "https://httpbin.org/get"
        webView.loadUrl(inputUrl)
    }
}