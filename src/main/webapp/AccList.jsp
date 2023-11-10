<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách tài khoản</title>
    <!-- Thêm Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Danh sách tài khoản</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên đầy đủ</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Trạng thái</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Account> listacc = AccountServices.getAccounts();
            for(Account account : listacc){
        %>
        <tr>
            <td><%= account.getAccount_id() %></td>
            <td><%= account.getFull_name() %></td>
            <td><%= account.getEmail() %></td>
            <td><%= account.getPhone() %></td>
            <td><%= account.getStatus() == 1 ? "hoạt động" : "không hoạt động" %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
