<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
  <div class="container">
    <a class="navbar-brand" href="student">
      QLSVTN
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-collapse navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="student">Trang chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="student?action=showForm">Khai báo tốt nghiệp</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
            Tìm kiếm
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="student?action=searchBasic">Tìm kiếm cơ bản</a></li>
            <li><a class="dropdown-item" href="student?action=searchAdvanced">Tìm kiếm nâng cao</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>