<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 9/29/2023
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Add account</title>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Thêm tài khoản</div>
                <div class="card-body">

                    <form action="ControlServlet" method="post">
                        <input type="hidden" name="action" value="addAccount">

                        <div class="mb-3">
                            <label for="account_id" class="form-label">Account ID:</label>
                            <input type="text" class="form-control" id="account_id" name="account_id" required
                                   maxlength="50">
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
                                <option value="0">0 (Không hoạt động)</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Thêm tài khoản</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Sử dụng Bootstrap JavaScript (nếu cần) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>