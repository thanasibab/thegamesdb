package controller;

import model.Purchase;
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
 * Servlet implementation class AdminHistoryPurchase
 */
public class AdminHistoryPurchase extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String LIST_GAMES = "/WEB-INF/admin/historyPurchase.jsp";
    private UserRepository userRepository;
    private CartRepository cartRepository;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHistoryPurchase() {
        this.userRepository = new UserRepository();
        this.cartRepository = new CartRepository();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");
        }

        try {

            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));


            List<Purchase> purchases = userRepository.allPurchases();
            request.setAttribute("purchases", purchases);
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
