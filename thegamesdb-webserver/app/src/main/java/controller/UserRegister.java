package controller;

import repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class UserRegister extends HttpServlet {

    private static String REGISTER_PAGE = "/WEB-INF/user/register.jsp";
    private UserRepository userRepository;

    public UserRegister() {
        this.userRepository = new UserRepository();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            boolean result = userRepository.addUser(request);

            if (result) {
                System.out.println("register success");
                HttpSession session = request.getSession();
                session.setAttribute("authenticated", true);
                response.sendRedirect("games");
                return;
            } else {
                System.out.println("register fail");
                response.sendRedirect("register?fail=true");
                return;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");
        }
        getServletContext().getRequestDispatcher(REGISTER_PAGE).forward(request, response);

    }
}