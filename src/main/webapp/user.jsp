<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices" %>
<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 9/29/2023
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow-x: auto; /* Thêm thanh cuộn ngang nếu bảng quá rộng */
        }

        .header {
            color: red;
        }

        .header h2 {
            color: darkorchid;
        }

        .account-info h4 {
            margin: 5px 0;
            color: #333; /* Đổi màu chữ cho phù hợp */
        }

        .account-status {
            font-weight: bold;
            color: green;
        }

        .log-list h2 {
            color: red;
        }

        .log-list ul {
            list-style-type: square;
            padding-left: 20px;
        }

        .role-table h2 {
            color: red;
        }

        .role-table table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .role-table th, .role-table td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            color: #333; /* Đổi màu chữ cho phù hợp */
        }

        .role-table th {
            background-color: #f2f2f2;
        }

        .logout-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        Account account = (Account) request.getAttribute("account");

        if (account != null) {
    %>

    <h2 class="header">Welcome <%= account.getFull_name()%>
    </h2>
    <div class="account-info">
        <h4>Id: <%= account.getAccount_id()%>
        </h4>
        <h4>Email: <%= account.getEmail()%>
        </h4>
        <h4>Phone: <%=account.getPhone()%>
        </h4>
        <h4 class="account-status">
            Status: <%=account.getStatus() == 1 ? "hoạt động" : "không hoạt động"%>
        </h4>
    </div>


    </tbody>
    </table>


    <div class="log-list">
        <h2>Log:</h2>
        <ul>
            <%
                List<String> logList = (List<String>) request.getSession().getAttribute("logList");
                if (logList != null) {
                    for (String log : logList) {
            %>
            <li><%= log %>
            </li>
            <%
                    }
                }
            %>
        </ul>
    </div>

    <%
        }

        if (account != null) {
            Role accountRoles = RoleServices.getRoleByAccountId(account.getAccount_id());

            if (accountRoles != null) {
    %>
    <div class="role-table">
        <h2>Roles for Account: <%= account.getFull_name() %>
        </h2>
        <table>
            <thead>
            <tr>
                <th>Role ID</th>
                <th>Role Name</th>
                <th>Description</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><%= accountRoles.getRole_id() %>
                </td>
                <td><%= accountRoles.getRole_name() %>
                </td>
                <td><%= accountRoles.getDescription() %>
                </td>
                <td><%= accountRoles.getStatus() == 1 ? "Active" : "Inactive" %>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <%
    } else {
    %>
    <p>No roles found for this account.</p>
    <%
            }
        }
    %>

    <div class="logout-button">
        <form action="ControlServlet" method="post">
            <input type="submit" value="logout" name="logout">
            <input type="hidden" name="action" value="logout">
        </form>
    </div>
</div>
</body>
</html>
