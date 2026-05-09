<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Tìm kiếm cơ bản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <h2>Tìm kiếm thông tin sinh viên</h2>

    <form action="student?action=search1" method="post" class="input-group mb-3">
        <input type="text" name="keyword" class="form-control" placeholder="Nhập tên hoặc CMND...">
        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
    </form>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Số CMND</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>Số ĐT</th>
            <th>Địa chỉ</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listSV}" var="sv">
            <tr>
                <td>${sv.soCMND}</td>
                <td>${sv.hoTen}</td>
                <td>${sv.email}</td>
                <td>${sv.soDT}</td>
                <td>${sv.diaChi}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="student" class="btn btn-secondary">Quay lại trang chủ</a>
</div>
</body>
</html>