<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Log" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.LogServices" %><%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 9/29/2023
  Time: 11:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Lịch Sử Đăng Nhập</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>id</th>
            <th>account_id</th>
            <th>login_time</th>
            <th>logout_time</th>
            <th>notes</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Log> listlog = LogServices.getLogs();
            for(Log log : listlog){
        %>
        <tr>
            <td><%= log.getId()%></td>
            <td><%= log.getAccount_id() %></td>
            <td><%= log.getLogin_time() %></td>
            <td><%= log.getLogout_time() %></td>
            <td><%= log.getNotes() %></td>
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
