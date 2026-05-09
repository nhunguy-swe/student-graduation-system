# Graduate & Career Management System (GCMS)

Hệ thống quản lý thông tin sinh viên tốt nghiệp và theo dõi tình trạng việc làm. Dự án được xây dựng trên nền tảng Java Web (Servlet/JSP) với kiến trúc MVC.

## Chức năng chính
* **Khai báo tốt nghiệp**: Cho phép sinh viên cập nhật thông tin cá nhân và thông tin bằng cấp (sử dụng Transaction để đảm bảo tính toàn vẹn dữ liệu).
* **Tìm kiếm cơ bản**: Tra cứu nhanh sinh viên theo Tên hoặc Số CMND.
* **Tìm kiếm nâng cao**: Tổng hợp dữ liệu từ nhiều bảng (Sinh viên, Tốt nghiệp, Công việc) để theo dõi lộ trình sự nghiệp của sinh viên sau khi ra trường.

## Công nghệ sử dụng
* **Backend**: Java Servlet, JDBC (Java Database Connectivity).
* **Frontend**: JSP, JSTL, Bootstrap 5 (Responsive Design).
* **Database**: MySQL / SQL Server.
* **Kiến trúc**: MVC (Model - View - Controller) & DTO (Data Transfer Object).

## Cấu trúc thư mục
- `src/main/java/controller`: Xử lý điều hướng và logic nghiệp vụ.
- `src/main/java/dao`: Thực hiện các truy vấn cơ sở dữ liệu.
- `src/main/java/model`: Các lớp thực thể (Entities) và DTO.
- `src/main/webapp`: Chứa các trang giao diện JSP.
- `src/main/resources`: Chứa file script cơ sở dữ liệu (`database.sql`).

## Hướng dẫn cài đặt
1. **Database**: Chạy file `src/main/resources/database.sql` để tạo bảng và dữ liệu mẫu.
2. **Cấu hình**: Chỉnh sửa thông tin kết nối (URL, Username, Password) trong file `src/main/java/utils/DBContext.java`.
3. **Chạy ứng dụng**: Deploy dự án lên Tomcat (phiên bản 9.0 hoặc 10.0) và truy cập qua đường dẫn `http://localhost:8080/student_management/`.
