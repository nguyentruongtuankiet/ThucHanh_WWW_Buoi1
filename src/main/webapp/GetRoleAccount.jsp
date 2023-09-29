<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.GrantAccess" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.GrantAccessServices" %><%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 9/29/2023
  Time: 11:43 PM
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
    <h1 class="mt-5">Danh sách các Rol</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>is_grant</th>
            <th>note</th>
            <th>account_id</th>
            <th>role_id</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<GrantAccess> listga = GrantAccessServices.getListGrantAccess();
            for(GrantAccess ga : listga){
        %>
        <tr>
            <td><%= ga.isIs_grant() == true ? 1 : 0%></td>
            <td><%= ga.getNote() %></td>
            <td><%= ga.getAccount().getAccount_id() %></td>
            <td><%= ga.getRole().getRole_id() %></td>
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
