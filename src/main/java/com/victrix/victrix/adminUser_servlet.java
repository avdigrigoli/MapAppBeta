package com.victrix.victrix;


import com.victrix.victrix.daos.adminUser_dao;
import com.victrix.victrix.models.adminUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/adminUser_servlet")
public class adminUser_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adminUser_servlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Admin Login!");
        String username = request.getParameter("uname");
        String password = request.getParameter("upwd");

        adminUser_dao userDao = new adminUser_dao();

        try {
            adminUser user = userDao.checkLogin(username, password);
            String destPage = "index.jsp";

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                /** MAKE IF STATEMENT TO CHECK IF THE USER IS AN ADMIN AND ONLY ADD THE ADMIN ATTRIBUTE IF THEY ARE**/
                session.setAttribute("admin", user);
                destPage = "map.jsp";
                request.getSession().removeAttribute("invalidlogin");
            } else {
                request.getSession().setAttribute("invalidlogin", "Incorrect Credentials!");
                destPage = "index.jsp";
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }
}