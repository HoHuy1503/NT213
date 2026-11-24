"""Local-only HTTPS fixture for the Android lab (Python 3)."""
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
import ssl
from uuid import UUID

LAB = Path(__file__).resolve().parent


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/webview_test":
            html = """<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>WebView Bridge Audit</title></head>
<body style="font-family:sans-serif; padding:20px;">
  <h2>Kiểm thử tương tác WebView Bridge</h2>
  <p>Trang này kiểm tra sự tồn tại của đối tượng <code>AndroidBridge</code>:</p>
  <div id="output" style="background:#eee; padding:10px; border-radius:5px;">Đang kiểm tra...</div>
  <script>
    const out = document.getElementById('output');
    if (window.AndroidBridge) {
      try {
        const token = window.AndroidBridge.getAppAuthToken();
        window.AndroidBridge.showToast("Cầu nối AndroidBridge hoạt động bình thường");
        out.innerHTML = "<b>Cầu nối JavaScriptInterface đã phát hiện!</b><br>Token nhận được: <code>" + token + "</code>";
      } catch (e) {
        out.innerHTML = "Lỗi khi gọi bridge: " + e;
      }
    } else {
      out.innerHTML = "<b>Không tìm thấy AndroidBridge</b> (Chế độ an toàn hoặc JavaScript bị vô hiệu hóa).";
    }
  </script>
</body>
</html>""".encode("utf-8")
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(html)))
            self.end_headers()
            self.wfile.write(html)
            print("GET /webview_test HTTP 200 (WebView bridge audit page)", flush=True)
            return

        if self.path != "/probe":
            self.send_error(404)
            return
        try:
            request_id = str(UUID(self.headers.get("X-Lab-Request", "")))
        except ValueError:
            self.send_error(400, "Expected UUID")
            return
        body = request_id.encode("ascii")
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)
        print(f"GET /probe HTTP 200 id={request_id}", flush=True)


if __name__ == "__main__":
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    ctx.load_cert_chain(LAB.parent / "app/src/main/res/raw/lab_server.pem",
                        LAB / ".tls/key.pem")
    with ThreadingHTTPServer(("127.0.0.1", 8443), Handler) as server:
        server.socket = ctx.wrap_socket(server.socket, server_side=True)
        print("Listening on https://localhost:8443/probe", flush=True)
        server.serve_forever()
