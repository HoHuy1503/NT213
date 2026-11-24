package com.example.targetapp

import android.os.Bundle
import android.webkit.WebView
import androidx.appcompat.app.AppCompatActivity

class SafeWebViewActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val view = WebView(this)
        view.settings.apply {
            javaScriptEnabled = false
            allowFileAccess = false
            allowContentAccess = false
            blockNetworkLoads = true
        }
        setContentView(view)
        view.loadDataWithBaseURL(null,
            "<html><meta charset='utf-8'><h2>WebView phòng thủ</h2>" +
                "<p>Trang nội bộ dùng nội dung cố định và không cung cấp JavaScript bridge.</p></html>",
            "text/html", "UTF-8", null)
    }
}
