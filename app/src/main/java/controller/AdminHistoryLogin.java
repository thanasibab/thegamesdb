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
import java.util.List;

/**
 * Servlet implementation class AdminHistoryLogin
 */
public class AdminHistoryLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String LIST_GAMES = "/WEB-INF/admin/historyLogin.jsp";
    private UserRepository userRepository;
    private CartRepository cartRepository;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHistoryLogin() {
        super();
        this.userRepository = new UserRepository();
        this.cartRepository = new CartRepository();

        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();

        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");
        }

        try {

            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));


            List<User> users = userRepository.all();
            request.setAttribute("users", users);
            getServletContext().getRequestDispatcher(LIST_GAMES).forward(request, response);

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
