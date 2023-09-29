<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 9/27/2023
  Time: 10:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Đăng nhập</div>
                <div class="card-body">
                    <form action="ControlServlet" method="post">
                        <input type="hidden" name="action" value="login">

                        <div class="mb-3">
                            <label for="username" class="form-label">Tên đăng nhập:</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Sử dụng Bootstrap JavaScript (nếu cần) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
    function showSuccessMessage(cookieValue) {
        alert(cookieValue);
    }

    <%
     String cookieValue = null;
     Cookie[] cookies = request.getCookies();
     if (cookies != null) {
         for (Cookie cookie : cookies) {
             if ("logout".equals(cookie.getName())) {
                 cookieValue = "Đăng Xuất Thành Công !!!";
                 break;
             }
         }
     }
 %>

    <% if (cookieValue != null) {%>
    showSuccessMessage('<%= cookieValue %>');
    <% }%>


    <%--    <%=cookieValue%>--%>
</script>
</body>
</html>
