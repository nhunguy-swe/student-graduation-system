<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Khai báo tốt nghiệp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .form-container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        .section-title { border-left: 5px solid #0d6efd; padding-left: 10px; margin-bottom: 20px; color: #0d6efd; }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-5">
    <div class="form-container">
        <h2 class="text-center mb-4">KHAI BÁO THÔNG TIN TỐT NGHIỆP</h2>

        <%-- Hiển thị thông báo lỗi nếu có --%>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Lỗi!</strong> ${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form action="student?action=insert" method="post" class="row g-3">

            <%-- NHÓM 1: THÔNG TIN CÁ NHÂN --%>
            <h5 class="section-title">1. Thông tin cá nhân</h5>
            <div class="col-md-4">
                <label class="form-label">Số CMND (*)</label>
                <input type="text" name="soCMND" class="form-control" placeholder="Nhập số CMND" required>
            </div>
            <div class="col-md-8">
                <label class="form-label">Họ và tên</label>
                <input type="text" name="hoTen" class="form-control" placeholder="Nhập đầy đủ họ tên">
            </div>
            <div class="col-md-4">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" placeholder="example@gmail.com">
            </div>
            <div class="col-md-4">
                <label class="form-label">Số điện thoại</label>
                <input type="text" name="soDT" class="form-control" placeholder="Nhập số điện thoại">
            </div>
            <div class="col-md-4">
                <label class="form-label">Địa chỉ hiện tại</label>
                <input type="text" name="diaChi" class="form-control" placeholder="Tỉnh/Thành phố">
            </div>

            <%-- NHÓM 2: THÔNG TIN TỐT NGHIỆP --%>
            <h5 class="section-title mt-4">2. Thông tin tốt nghiệp</h5>
            <div class="col-md-6">
                <label class="form-label">Trường đại học (*)</label>
                <select name="maTruong" class="form-select" required>
                    <option value="">-- Chọn trường --</option>
                    <c:forEach items="${listTruong}" var="t">
                        <option value="${t.maTruong}">${t.tenTruong}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Ngành học (*)</label>
                <select name="maNganh" class="form-select" required>
                    <option value="">-- Chọn ngành --</option>
                    <c:forEach items="${listNganh}" var="n">
                        <option value="${n.maNganh}">${n.tenNganh}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-4">
                <label class="form-label">Hệ tốt nghiệp</label>
                <select name="heTN" class="form-select">
                    <option value="Chính quy">Chính quy</option>
                    <option value="Liên thông">Liên thông</option>
                    <option value="Văn bằng 2">Văn bằng 2</option>
                    <option value="Từ xa">Từ xa</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Ngày tốt nghiệp (*)</label>
                <input type="date" name="ngayTN" class="form-control" required>
            </div>
            <div class="col-md-4">
                <label class="form-label">Loại tốt nghiệp</label>
                <select name="loaiTN" class="form-select">
                    <option value="Xuất sắc">Xuất sắc</option>
                    <option value="Giỏi">Giỏi</option>
                    <option value="Khá">Khá</option>
                    <option value="Trung bình">Trung bình</option>
                </select>
            </div>

            <%-- NÚT BẤM --%>
            <div class="col-12 text-center mt-5">
                <hr>
                <button type="submit" class="btn btn-primary px-5 py-2">
                    <i class="bi bi-save"></i> Lưu dữ liệu
                </button>
                <a href="student" class="btn btn-outline-secondary px-5 py-2">Quay lại</a>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>