package controller;

import model.Mailer;
import repository.CartRepository;
import repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Random;

/**
 * Servlet implementation class UserReset
 */
public class UserReset extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static String FORGOT_PAGE = "/WEB-INF/user/reset.jsp";
    private UserRepository userRepository;
    private CartRepository cartRepository;

    public UserReset() {
        this.userRepository = new UserRepository();
        this.cartRepository = new CartRepository();
    }

    public static String generatePass() {

        Random RANDOM = new SecureRandom();

        String options = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";

        String password = "";
        for (int i = 0; i < 10; i++) {
            int index = (int) (RANDOM.nextDouble() * options.length());
            password += options.substring(index, index + 1);
        }
        return password;
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");
        }
        try {

            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));
        } catch (SQLException e) {
        }

        getServletContext().getRequestDispatcher(FORGOT_PAGE).forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");

        if (username != null) {
            try {
                boolean result = userRepository.checkUser(username);

                if (result) {
                    String newPass = generatePass();
                    response.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    String to = request.getParameter("email");
                    long unixTime = System.currentTimeMillis();
                    String message = newPass + "-" + unixTime;
                    String subject = "new password request";
                    Mailer.send(to, subject, message);
                    out.println("Mail send successfully");
                    userRepository.resetPass(username, message);
                    response.sendRedirect("login?newpass=true");

                } else {
                    System.out.println("Username provided does not exist!");
                    response.sendRedirect("forgotPass?fail=true");
                }

            } catch (SQLException ex) {
                throw new ServletException(ex);
            }

        } else {
            System.out.println("You did not enter a username!");
            response.sendRedirect("forgotPass?fail=true");
        }

    }

}
