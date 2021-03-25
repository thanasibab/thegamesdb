package controller;

import model.CartItem;
import repository.CartRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


/**
 * Servlet implementation class CartCart
 */
public class CartCart extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String LIST_GAMES = "/WEB-INF/cart/cart.jsp";
    private CartRepository cartRepository;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartCart() {
        super();
        this.cartRepository = new CartRepository();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();

        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");
        }


        if (session.getAttribute("userId") != null) {

            try {
                List<CartItem> items = cartRepository.items((String) session.getAttribute("userId"));
                request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));
                request.setAttribute("cartTotalPrice", cartRepository.getTotalPrice((String) session.getAttribute("userId")));
                request.setAttribute("items", items);
                getServletContext().getRequestDispatcher(LIST_GAMES).forward(request, response);
            } catch (SQLException ex) {
                throw new ServletException(ex);
            }
        } else {

            System.out.println("User id is null");

        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // user_id given
        // game_id
        HttpSession session = request.getSession();

        if (request.getParameter("game_id") != null && request.getParameter("qty") != null && session.getAttribute("userId") != null) {
            try {
                cartRepository.addItem((String) session.getAttribute("userId"), Integer.parseInt(request.getParameter("game_id")), Integer.parseInt(request.getParameter("qty")));
                int cartTotal = cartRepository.getTotalItems((String) session.getAttribute("userId"));
                response.getWriter().append(Integer.toString(cartTotal));

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (request.getParameter("update") != null && request.getParameter("qty") != null && request.getParameter("item_id") != null) {

            try {
                cartRepository.updateItem((String) session.getAttribute("userId"), Integer.parseInt(request.getParameter("item_id")), Integer.parseInt(request.getParameter("qty")));

                int cartTotal = cartRepository.getTotalItems((String) session.getAttribute("userId"));
                double cartTotalPrice = cartRepository.getTotalPrice((String) session.getAttribute("userId"));
                String output = String.format("{ \"success\": \"true\", \"%s\" : \"%d\", \"%s\" : \"%f\" }", "cartTotal", cartTotal, "cartTotalPrice", cartTotalPrice);

                response.setContentType("application/json");
                response.getWriter().append(output);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (request.getParameter("delete") != null && request.getParameter("item_id") != null) {

            try {
                cartRepository.removeItem((String) session.getAttribute("userId"), Integer.parseInt(request.getParameter("item_id")));
                int cartTotal = cartRepository.getTotalItems((String) session.getAttribute("userId"));
                double cartTotalPrice = cartRepository.getTotalPrice((String) session.getAttribute("userId"));
                String output = String.format("{ \"success\": \"true\", \"%s\" : \"%d\", \"%s\" : \"%f\" }", "cartTotal", cartTotal, "cartTotalPrice", cartTotalPrice);

                response.setContentType("application/json");
                response.getWriter().append(output);


            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            response.getWriter().append("game_id is missing");
        }
    }

}
