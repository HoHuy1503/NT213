# Thử nghiệm T20 trên TargetApp

## Chạy đối chứng TLS trên Windows

Trong checkout hiện tại đã có khóa riêng ở `lab/.tls`. Trên máy mới, chạy `pwsh -File lab/setup-tls.ps1` một lần trước khi build. Lệnh tạo chứng thư và pin riêng cho checkout đó. Chỉ chứng thư công khai đi vào APK. Khi đổi chứng thư, build và cài lại app.

1. Từ thư mục dự án chạy `python lab/server.py`. Máy chủ chỉ lắng nghe trên loopback cổng 8443.
2. Khởi động emulator. Trong terminal khác chạy `adb reverse tcp:8443 tcp:8443`, rồi chạy bản debug từ Android Studio. Dùng kết nối trực tiếp cho hai ca đối chứng.
3. Bấm **HTTPS · pin hợp lệ**. Kỳ vọng app hiển thị HTTP 200 và ID giống dòng GET trên terminal.
4. Bấm **Đối chứng · pin OkHttp sai**. Chỉ pin OkHttp thay đổi. Kỳ vọng app hiển thị lỗi xác minh peer và terminal không có GET với ID mới. Nếu ca đầu lỗi, lưu loại lỗi và xử lý kết nối trước khi kết luận về ca thứ hai.
5. Ghi Android API, phiên bản APK (SHA-256), OkHttp 5.5.0, ngày chạy, ID và ảnh kết quả. APK đã patch ở gốc dự án là hiện vật của phiên bản trước dùng httpbin. Cần ghi rõ phiên bản khi so sánh.

## WebView và root

WebView bản lab nhận TARGET_URL qua Intent extra và có AndroidBridge trả về dữ liệu mẫu. Nút trên màn hình chính dùng URL cố định. Bản phòng thủ là Activity nội bộ chỉ hiển thị HTML cố định, tắt JavaScript và truy cập mạng, file, content URI. Khi báo cáo, ghi rõ quan sát nào đến từ mã nguồn và quan sát nào đến từ thiết bị. Nút root báo dấu hiệu phát hiện được, độc lập với request mạng.

## Nhật ký đo

Đo hai hướng trên cùng phiên bản đầu vào và cấu hình emulator. Ghi riêng phút chuẩn bị và phút thực hiện, từ lúc bắt đầu phân tích đến khi có bằng chứng đạt tiêu chí. Với hook, điểm mạnh là giữ APK gốc và quan sát trong phiên chạy. Với patch, kết quả nằm trong bản đóng gói riêng và cần quản lý phiên bản cùng chữ ký.

## Nhật ký đo lường và So sánh thực nghiệm

Đo hai hướng trên cùng phiên bản APK đầu vào và cùng cấu hình thiết bị/emulator. Ghi nhận thời gian từ khi bắt đầu dịch ngược đến khi hoàn thành bypass và trích xuất traffic thành công.

| Ca kiểm thử | Tiêu chí đạt chuẩn | Kịch bản & Kết quả mong đợi | Ghi chú & Minh chứng |
|---|---|---|---|
| **Pin hợp lệ (Gốc)** | Server nhận đúng UUID, App hiển thị HTTP 200 | App nạp chứng thư `lab_server.pem`, tính đúng hash SPKI, kết nối thành công tới TLS server. | Lưu log GET terminal và màn hình thông báo ID |
| **Pin sai (Đối chứng)** | Lỗi `SSLPeerUnverifiedException`, server không nhận request | OkHttp phát hiện pin giả mạo `sha256/AAAA...`, ngắt kết nối TLS ngay tại tầng bắt tay (handshake). | Không có log GET mới trên server |
| **Bypass qua Frida Hook** | Cả nút Pin sai và Pin hợp lệ đều trả về HTTP 200 | Hook in-memory: Bỏ qua kiểm tra root (`isDeviceRooted() -> false`), vô hiệu hóa hàm `CertificatePinner.check()` và chèn `UniversalTrustManager`. | APK nguyên bản, đối chiếu bản ghi proxy/server |
| **Bypass qua Smali Patch** | Cài đặt APK sửa đổi, Pin sai vẫn gửi được HTTP 200 | Patch tĩnh: Bytecode `isDeviceRooted` trả về 0, `CertificatePinner.check` đổi thành `return-void`, XML gỡ thẻ `<pin-set>`. | Thay đổi chữ ký APK (debug keystore), mã SHA-256 mới |
| **WebView Khai thác vs Phòng thủ** | Kiểm chứng rò rỉ JWT qua `AndroidBridge` | `VulnerableWebViewActivity` cho phép đọc token qua JS Interface; `SafeWebViewActivity` chặn hoàn toàn JS, file, và network load. | So sánh rủi ro theo AutoSpill (Gangwal et al., 2023) |

---

## Bảng đánh giá: Cơ chế phòng thủ × Chi phí bypass (Thời gian / Kỹ năng)

*Tổng hợp phân tích dựa trên thực nghiệm phòng lab và đối chiếu 8 công trình nghiên cứu học thuật:*

| Cơ chế phòng thủ | Mức độ triển khai | Khả năng chống Hook (Frida) | Khả năng chống Patch (Smali) | Chi phí bypass ước tính | Kỹ năng & Công cụ yêu cầu | Nhận định học thuật |
|---|---|---|---|---|---|---|
| **Pinning tầng Java/Kotlin (OkHttp + NSC)** | Đã triển khai | **Rất thấp** (Dễ bị bypass) | **Rất thấp** (Dễ bị bypass) | **30 - 60 phút** | • jadx, Frida, apktool<br>• Hiểu cấu trúc class OkHttp & XML Android | Phổ biến nhất nhưng dễ bị gỡ bỏ in-memory hoặc sửa bytecode do mã nằm hoàn toàn trong tầng ứng dụng (*Wang et al., 2020; Luo et al., 2024*). |
| **Làm rối mã (Obfuscation: R8 / ProGuard)** | Cấu hình trong build release | **Trung bình** (Gây chậm trễ) | **Trung bình** (Gây chậm trễ) | **2 - 4 giờ** | • Phân tích CFG, string xref<br>• Frida dynamic scan hoặc hook tầng thấp (Conscrypt) | Gây khó khăn khi tìm tên hàm/lớp (như `okhttp3.CertificatePinner`), nhưng không thể bảo vệ nếu attacker hook các API chuẩn của framework (*Berlato et al., 2020*). |
| **Kiểm tra toàn vẹn & Chữ ký (Anti-Repackaging)** | Mô phỏng qua kiểm tra SHA-256 | **Thấp** (Frida không sửa file trên đĩa) | **Rất cao** (Chống patch triệt để) | **4 - 8 giờ** (đối với Patch) | • Ghidra, jadx, smali debug<br>• Tìm và vô hiệu hóa hàm verify APK signature | Triệt tiêu hoàn toàn khả năng chạy APK repackaged trừ khi attacker đảo ngược thành công mọi tầng kiểm tra chữ ký (*Merlo et al., 2021*). |
| **Native SSL Pinning (C/C++ BoringSSL / OpenSSL)** | Khảo sát lý thuyết | **Rất cao** (Làm tăng chi phí nhất) | **Rất cao** (Làm tăng chi phí nhất) | **8 - 24+ giờ** | • IDA Pro / Ghidra, GDB/LLDB<br>• Frida Native Interceptor (`Memory.scan`, offset hook) | **Làm tăng chi phí tấn công cao nhất**: Loại bỏ hoàn toàn bề mặt tấn công của máy ảo Dalvik/ART, buộc attacker phải dịch ngược mã máy ARM/x86 và hook hàm native (*Pradeep et al., 2022*). |

---

## So sánh kỹ thuật: Hook Runtime (Frida) vs. Static Patching (Smali)

1. **Về tính toàn vẹn và Chữ ký số:**
   * *Frida Hook:* Giữ nguyên 100% tệp APK gốc và chữ ký của nhà phát triển. Vượt qua mọi cơ chế kiểm tra tính toàn vẹn tĩnh (Static Signature/Checksum Verification).
   * *Smali Patch:* Phải giải nén, chỉnh sửa bytecode và ký lại bằng keystore cá nhân. Bị phát hiện ngay lập tức bởi các hệ thống kiểm tra chữ ký runtime hoặc Play Integrity API.
2. **Về yêu cầu môi trường thực thi:**
   * *Frida Hook:* Đòi hỏi thiết bị có quyền root (hoặc repackage nhúng `frida-gadget.so`) để chạy tiến trình `frida-server`. Dễ bị phát hiện bởi cơ chế Anti-Frida/pTrace.
   * *Smali Patch:* Sau khi patch và ký thành công, ứng dụng có thể cài đặt và chạy trên mọi thiết bị Android thông thường mà không cần quyền root.
3. **Về tính ứng dụng thực tiễn:**
   * *Frida:* Thích hợp nhất cho quy trình Đánh giá an ninh (Penetration Testing) và phân tích động vì cho phép quan sát, ghi log và thay đổi dữ liệu runtime theo thời gian thực.
   * *Patch Smali:* Thích hợp cho việc tạo ra một bản đóng gói độc lập để phân phối lại (Repackaging).
