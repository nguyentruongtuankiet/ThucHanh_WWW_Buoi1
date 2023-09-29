<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices" %>
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
    <meta charset="UTF-8">
    <title>DashBoard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            padding: 20px;
        }

        .header h2 {
            color: darkorchid;
        }

        .account-info h4 {
            margin: 5px 0;
        }

        .account-status {
            font-weight: bold;
        }

        .link-all {
            color: red;
            font-size: 22px;
        }

        .role-info h2 {
            color: darkorchid;
        }

        .role-info p {
            margin: 5px 0;
        }

        .btn-container {
            margin-top: 20px;
            text-align: center;
        }

        .btn-container a {
            margin: 0 10px;
            text-decoration: none;
            color: darkorchid;
        }

        .logout-btn {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container justify-content-center">
    <%
        HttpSession sesson = request.getSession();
        Account account = (Account) request.getAttribute("account");
        Account account1 = (Account) sesson.getAttribute("1account");
        if (account == null) {
            System.out.println("chạy account của sesion");
            account = account1;
        }
        if (account != null) {
    %>
    <div class="header">
        <h2>Welcome Admin:  <%= account.getFull_name()%>
        </h2>
    </div>
    <div class="account-info">
        <h4>Id: <%= account.getAccount_id()%>
        </h4>
        <h4>Email: <%= account.getEmail()%>
        </h4>
        <h4>Phone: <%=account.getPhone()%>
        </h4>
        <h4 class="account-status">Status: <%=account.getStatus() == 1 ? "hoạt động" : "không hoạt động"%>
        </h4>
    </div>
    <%
        }
    %>

    <p>Xem danh sách tài khoản hiện có</p>
    <a class="link-all" href="AccList.jsp">Danh sách tài khoản</a>

    <%
        System.out.println(account);
        Role rolePermissions = RoleServices.getRoleByAccountId(account.getAccount_id());

        if (rolePermissions != null) {
    %>
    <div class="role-info">
        <h2>Role Information</h2>
        <p>Role ID: <%= rolePermissions.getRole_id() %>
        </p>
        <p>Role Name: <%= rolePermissions.getRole_name() %>
        </p>
        <p>Description: <%= rolePermissions.getDescription() %>
        </p>
        <p>Status: <%= rolePermissions.getStatus() == 1 ? "Hoạt động" : "Không hoạt động" %>
        </p>
    </div>
    <%
    } else {
    %>
    <p>No role found for this roleId.</p>
    <%
        }
    %>

    <div class="btn-container">
        <a href="addAccount.jsp">Thêm Tài khoản</a>
        <a href="updateAccount.jsp">Sửa Tài khoản</a>
        <a href="deleteAccount.jsp">Xóa Tài khoản</a>
        <a href="SetRoleAccount.jsp">Phân Quyền</a>
        <a href="GetRoleAccount.jsp">Xem vai Trò</a>
        <a href="GetLog.jsp">Xem Lịch Sử Đăng Nhập</a>
    </div>
    <div class="logout-btn">
        <form action="ControlServlet" method="post">
            <input type="submit" class="btn btn-danger" value="logout" name="logout">
            <input type="hidden" name="action" value="logout">
        </form>
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
             if ("Insert".equals(cookie.getName())) {
                 cookieValue = "Thêm Thành Công !!!";
                 break;
             } else if ("Delete".equals(cookie.getName())) {
                 cookieValue = "Xóa Thành Công !!!";
                 break;
             } else if ("Update".equals(cookie.getName())) {
                 cookieValue = "Cập Nhật Thành Công !!!";
                 break;
             }else if ("Setrole".equals(cookie.getName())) {
                 cookieValue = "Phân Quyền thành Công !!!";
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
