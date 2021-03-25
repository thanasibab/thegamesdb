package controller;

import repository.CartRepository;
import repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class UserLogin extends javax.servlet.http.HttpServlet {

    private static String LOGIN_PAGE = "/WEB-INF/user/login.jsp";
    private UserRepository userRepository;
    private CartRepository cartRepository;


    public UserLogin() {
        this.userRepository = new UserRepository();
        this.cartRepository = new CartRepository();
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String userId;
        String password;

        userId = request.getParameter("userId");
        password = request.getParameter("password");

        try {
            String result = userRepository.authenticate(userId, password);
            if (result.equals("success-admin")) {
                System.out.println("admin login success");
                HttpSession session = request.getSession();
                session.setAttribute("authenticated", true);
                session.setAttribute("userId", userId);
                session.setAttribute("admin", true);
                response.sendRedirect("games");

            } else if (result.equals("success-user")) {
                System.out.println("user login success");
                HttpSession session = request.getSession();
                session.setAttribute("authenticated", true);
                session.setAttribute("userId", userId);
                response.sendRedirect("games");
            } else if (result.equals("fail")) {
                System.out.println("login fail");
                response.sendRedirect("login?fail=true");

            } else if (result.equals("locked")) {
                System.out.println("account locked");
                response.sendRedirect("login?locked=true");

            } else {
                System.out.println("login with temp pass too late");
                response.sendRedirect("login?timeLimit=true");
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");
        }
        try {

            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));
        } catch (Exception e) {

        }
        getServletContext().getRequestDispatcher(LOGIN_PAGE).forward(request, response);

    }

}