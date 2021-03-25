package controller;

import model.User;
import repository.CartRepository;
import repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class UserEdit extends HttpServlet {

    private static String UPDATE_PAGE = "/WEB-INF/user/edit.jsp";
    private UserRepository userRepository;
    private CartRepository cartRepository;

    public UserEdit() {
        this.userRepository = new UserRepository();
        this.cartRepository = new CartRepository();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String currentUser = (String) session.getAttribute("userId");
        System.out.println("Current user: " + currentUser);
        String newUserId = request.getParameter("userId");
        System.out.println("new user id: " + newUserId);

        if (request.getParameter("toggle") != null && request.getParameter("user_id") != null) {

            String lockStatus;
            try {
                lockStatus = userRepository.changeLock(request.getParameter("user_id"));


                String output = String.format("{ \"success\": \"true\", \"%s\" : \"%s\" }", "lockStatus", lockStatus);

                response.setContentType("application/json");
                response.getWriter().append(output);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {


            try {
                Boolean result = userRepository.updateUser(request, currentUser);

                if (result == true) {
                    System.out.println("update success");
                    System.out.println("result: " + newUserId);
                    session.setAttribute("authenticated", true);
                    session.setAttribute("userId", newUserId);
                    System.out.println(session.getAttribute("userId"));
                    response.sendRedirect("games");
                    return;
                } else {
                    System.out.println("update fail");
                    response.sendRedirect("update?fail=true");
                    return;
                }

            } catch (SQLException ex) {
                throw new ServletException(ex);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
                request.setAttribute("authenticated", "true");
            }
            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));


            User user = userRepository.userById((String) session.getAttribute("userId"));
            request.setAttribute("user", user);
            getServletContext().getRequestDispatcher(UPDATE_PAGE).forward(request, response);

        } catch (SQLException e) {


        }

    }
}