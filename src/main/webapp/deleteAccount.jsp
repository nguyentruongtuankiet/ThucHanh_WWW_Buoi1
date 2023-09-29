<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 9/29/2023
  Time: 6:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <form action="ControlServlet" method="post">
        <input type="hidden" name="action" value="deleteAccount">
        <div class="form-group">
            <label for="account_id">Nhập mã Account ID cần xóa:</label>
            <input type="text" class="form-control" id="account_id" name="account_id" required maxlength="50">
        </div>

        <button type="submit" class="btn btn-primary" name="deleteAccount">Xóa tài khoản</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
