package controller;

import repository.CartRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class GameSearch
 */
public class GameSearch extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String SEARCH_PAGE = "/WEB-INF/game/search.jsp";
    private CartRepository cartRepository;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameSearch() {
        super();
        this.cartRepository = new CartRepository();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession(false);
        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");

        }
        try {

            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));
        } catch (Exception e) {

        }

        getServletContext().getRequestDispatcher(SEARCH_PAGE).forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}