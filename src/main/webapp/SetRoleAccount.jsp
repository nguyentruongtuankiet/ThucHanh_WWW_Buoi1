<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
Created by IntelliJ IDEA.
User: Tuan Kiet
Date: 9/27/2023
Time: 10:30 AM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Thêm tài khoản</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    HttpSession sesson = request.getSession();
    Account account1 = (Account) sesson.getAttribute("1account");
    List<Role> listRole = RoleServices.getRoles();
    List<Account> listAcc = AccountServices.getAccounts();
%>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h2 class="text-center">Set Role For User:</h2>
        </div>
        <div class="card-body">
            <form action="ControlServlet" method="post">
                <input type="hidden" name="action" value="SetRoleAccount">

                <div class="form-group">
                    <label for="account_id">Account ID:</label>
                    <select class="form-control" id="account_id" name="account_id" required>
                        <% for (Account account : listAcc) {
                            if (!account.getAccount_id().equals(account1.getAccount_id())) {
                        %>

                        <option value="<%= account.getAccount_id() %>"><%= account.getAccount_id() %>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="role_id">Role ID:</label>
                    <select class="form-control" id="role_id" name="role_id" required>
                        <% for (Role role : listRole) { %>
                        <option value="<%= role.getRole_id() %>"><%= role.getRole_id() %>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="is_grant">Is Grant:</label>
                    <select class="form-control" id="is_grant" name="is_grant" required>
                        <option value="1">1 (True)</option>
                        <option value="0">0 (False)</option>
                    </select>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Thêm tài khoản</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
