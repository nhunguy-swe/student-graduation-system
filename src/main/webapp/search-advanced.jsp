<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Tìm kiếm việc làm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <h2>Tìm kiếm thông tin tốt nghiệp & việc làm</h2>
    <form action="student?action=search2" method="post" class="input-group mb-3">
        <input type="text" name="keyword" class="form-control" placeholder="Nhập tên hoặc CMND...">
        <button class="btn btn-success" type="submit">Tìm kiếm</button>
    </form>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Số CMND</th>
            <th>Họ Tên</th>
            <th>Ngành (TN)</th>
            <th>Trường</th>
            <th>Ngành (CTy)</th>
            <th>Tên Công Ty</th>
            <th>Thời gian làm việc</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listResult}" var="r">
            <tr>
                <td>${r.soCMND}</td>
                <td>${r.hoTen}</td>
                <td>${r.maNganhTN}</td>
                <td>${r.maTruongTN}</td>
                <td>${r.maNganhCTy}</td>
                <td>${r.tenCongTy}</td>
                <td>${r.thoiGianLamViec}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="student" class="btn btn-secondary">Quay lại trang chủ</a>
</div>
</body>
</html>