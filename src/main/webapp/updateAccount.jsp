<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.repositories.AccRepositories" %>
<%@ page import="vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    List<Account> accountList = AccountServices.getAccounts();
    List<String> listIdAcc = new ArrayList<>();
    for (Account acc : accountList) {
        listIdAcc.add(acc.getAccount_id());
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Update Account</div>
                <div class="card-body">
                    <form action="ControlServlet" method="post">
                        <input type="hidden" name="action" value="updateAccount">

                        <div class="mb-3">
                            <label for="account_id" class="form-label">Account ID:</label>
                            <select class="form-select" id="account_id" name="account_id" required>
                                <% for (String accountId : listIdAcc) { %>
                                <option value="<%= accountId %>"><%= accountId %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="full_name" class="form-label">Full Name:</label>
                            <input type="text" class="form-control" id="full_name" name="full_name" required
                                   maxlength="50">
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required
                                   maxlength="50">
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" maxlength="50">
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone:</label>
                            <input type="text" class="form-control" id="phone" name="phone" maxlength="50">
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">Status:</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="1">1 (Hoạt động)</option>
                                <option value="0">0 (Không Hoạt Động)</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary" name="updateAccount">Update Account</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
