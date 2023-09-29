package vn.edu.iuh.fit.thuchanhwww_buoi1.controls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Account;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.GrantAccess;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Log;
import vn.edu.iuh.fit.thuchanhwww_buoi1.models.Role;
import vn.edu.iuh.fit.thuchanhwww_buoi1.services.AccountServices;
import vn.edu.iuh.fit.thuchanhwww_buoi1.services.GrantAccessServices;
import vn.edu.iuh.fit.thuchanhwww_buoi1.services.LogServices;
import vn.edu.iuh.fit.thuchanhwww_buoi1.services.RoleServices;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/ControlServlet"})
public class ControlServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("login".equals(action)) {
            handleLogin(req, resp);
        } else if ("addAccount".equals(action)) {
            handleAddAccount(req, resp);
        } else if ("updateAccount".equals(action)) {

            handleUpdateAccount(req, resp);
        } else if ("deleteAccount".equals(action)) {

            handleDeleteAccount(req, resp);
        } else if ("SetRoleAccount".equals(action)) {

            handleSetRoleAccount(req, resp);
        } else if ("logout".equals(action)) {

            handleLogout(req, resp);
        }


    }

    private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String email = req.getParameter("username");
        String password = req.getParameter("password");

        if (AccountServices.checkAcc(email, password)) {
            HttpSession sesson = req.getSession();
            List<String> logList = (List<String>) sesson.getAttribute("logList");
            if (logList == null) {
                logList = new ArrayList<>();
            }
            Account account = AccountServices.getAccByEmail(email);
            String account_id = AccountServices.getAccIdByEmail(email);
//            logRepository.addLoginLog(account_id);
            Date date = new Date();
            String logEntry = "Đăng nhập thành công vào lúc: " + new Date();
            String timeLogin = new Timestamp(date.getTime()) + "";
//            System.out.println(new Date());
            logList.add(logEntry);
            sesson.setAttribute("logList", logList);
            sesson.setAttribute("timeLogin", timeLogin);
            sesson.setAttribute("1account", account);
//            sesson.setAttribute("email", email);
//
//            System.out.println("account_id: " + account_id);
            String userRole = RoleServices.getRoleNameByAccountId(account_id);
            System.out.println(userRole);

            if ("administrator".equals(userRole)) {
                req.setAttribute("account", account);
                req.getRequestDispatcher("admin.jsp").forward(req, resp);
            } else if ("user".equals(userRole)) {
                req.setAttribute("account", account);
                req.getRequestDispatcher("user.jsp").forward(req, resp);
            } else {
                System.out.println("lỗi 2");
                req.setAttribute("error", "invalid user or password");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        } else {
            System.out.println("lỗi 1");
            req.setAttribute("error", "invalid user or password");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

    private void handleAddAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String account_id = req.getParameter("account_id");
        String full_name = req.getParameter("full_name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        byte status = Byte.valueOf(req.getParameter("status"));

        Account account = new Account(account_id, full_name, password, email, phone, status);
        System.out.println(account);
        AccountServices.insertAccount(account);
        Cookie cookie = new Cookie("Insert", "Insert");
        cookie.setMaxAge(5);
        resp.addCookie(cookie);
        resp.sendRedirect("admin.jsp");
    }

    private void handleUpdateAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account_id = req.getParameter("account_id");
        String full_name = req.getParameter("full_name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        byte status = Byte.valueOf(req.getParameter("status"));
        Account account = new Account(account_id, full_name, password, email, phone, status);
        AccountServices.insertAccount(account);
        Cookie cookie = new Cookie("Update", "Update");
        cookie.setMaxAge(5);
        resp.addCookie(cookie);
        resp.sendRedirect("admin.jsp");
    }

    private void handleDeleteAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account_id = req.getParameter("account_id");
        AccountServices.dellAccount(account_id);
        Cookie cookie = new Cookie("Delete", "Delete");
        cookie.setMaxAge(5);
        resp.addCookie(cookie);
        resp.sendRedirect("admin.jsp");

    }

    private void handleSetRoleAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account_id = req.getParameter("account_id");
        System.out.println(account_id);
        String role_id = req.getParameter("role_id");
        System.out.println(role_id);
        int is_grant = Integer.parseInt(req.getParameter("is_grant"));
        boolean grant = (is_grant == 1) ? true : false;

        Role role = RoleServices.searchRole(role_id);
        Account acc = AccountServices.searchAccount(account_id);
        GrantAccess ga = new GrantAccess(grant, "", acc, role);


        List<GrantAccess> listga = GrantAccessServices.getListGrantAccess();

        for (GrantAccess ga1 : listga) {
            if (ga1.getAccount().getAccount_id().equals(account_id)) {
                GrantAccessServices.dellGrantAccess(ga1);
            }
        }
        GrantAccessServices.insertGrantAccess(ga);
        Cookie cookie = new Cookie("Setrole", "Setrole");
        cookie.setMaxAge(5);
        resp.addCookie(cookie);
        resp.sendRedirect("admin.jsp");


    }

    private void handleLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Date date = new Date();
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("1account");
        String accId = acc.getAccount_id();
        System.out.println(accId);
        String timeLoginStr = (String) session.getAttribute("timeLogin");
        Timestamp timeLogin = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date parsedDate = dateFormat.parse(timeLoginStr);
            timeLogin = new Timestamp(parsedDate.getTime());
            System.out.println(timeLogin);
        } catch (ParseException e) {
            e.printStackTrace();

        }
        Timestamp timeLogout = new Timestamp(date.getTime());
        System.out.println(timeLogout);
        Log log = new Log(accId, timeLogin, timeLogout, "oke");
        System.out.println(log);
        LogServices.insertLog(log);
        Cookie cookie = new Cookie("logout", "logout");
        cookie.setMaxAge(5);
        resp.addCookie(cookie);
        resp.sendRedirect("index.jsp");

    }


}
