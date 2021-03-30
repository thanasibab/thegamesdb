package controller;

import repository.CartRepository;
import repository.GameRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class UserFavorite extends HttpServlet {

    public static String LIST_GAME = "/WEB-INF/user/favorite.jsp";
    private GameRepository gameRepository;
    private CartRepository cartRepository;

    public UserFavorite() {
        this.gameRepository = new GameRepository();
        this.cartRepository = new CartRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
            request.setAttribute("authenticated", "true");
        }


        try {
            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));
            if (request.getParameter("favorite") != null) {

                gameRepository.addFavorite(Integer.parseInt(request.getParameter("favorite")), (String) session.getAttribute("userId"));


            } else if (request.getParameter("remove") != null) {
                gameRepository.removeFavorite(Integer.parseInt(request.getParameter("remove")), (String) session.getAttribute("userId"));
            }

            request.setAttribute("games", gameRepository.allFavorites((String) session.getAttribute("userId")));
            getServletContext().getRequestDispatcher(LIST_GAME).forward(request, response);


        } catch (Exception e) {

        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
