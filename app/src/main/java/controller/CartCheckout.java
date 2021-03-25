package controller;

import repository.CartRepository;
import repository.GameRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class CartCheckout
 */
@WebServlet("/CartCheckout")
public class CartCheckout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static String CHECKOUT_PAGE = "/WEB-INF/cart/checkout.jsp";
    private GameRepository gameRepository;
    private CartRepository cartRepository;

    public CartCheckout() {
        this.gameRepository = new GameRepository();
        this.cartRepository = new CartRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {

            if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
                request.setAttribute("authenticated", "true");
            }

            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));
            getServletContext().getRequestDispatcher(CHECKOUT_PAGE).forward(request, response);


        } catch (Exception e) {

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        boolean creditNum = request.getParameter("creditNumber") != null && !request.getParameter("creditNumber").isEmpty() && request.getParameter("creditNumber").chars().allMatch(Character::isDigit);
        boolean creditCvv = request.getParameter("creditCvv") != null && !request.getParameter("creditCvv").isEmpty() && request.getParameter("creditCvv").chars().allMatch(Character::isDigit);
        try {
            if (creditNum == true && creditCvv == true) {
                response.sendRedirect("checkout?success=true");
                cartRepository.checkOut((String) session.getAttribute("userId"));
                // empty cart54333333

            } else {
                System.out.println("Credit Information Wrong!");
                response.sendRedirect("checkout?fail=true");
            }

        } catch (Exception e) {

        }
    }

}
