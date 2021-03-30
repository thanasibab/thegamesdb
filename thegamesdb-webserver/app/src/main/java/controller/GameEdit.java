package controller;

import model.Game;
import repository.CartRepository;
import repository.GameRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class GameEdit extends HttpServlet {

    private static String EDIT_GAME = "/WEB-INF/game/edit.jsp";
    private GameRepository gameRepository;
    private CartRepository cartRepository;
    private int gameId;

    public GameEdit() {
        this.gameRepository = new GameRepository();
        this.cartRepository = new CartRepository();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Boolean result = gameRepository.updateGame(request, gameId);

            if (result == true) {
                System.out.println("update success");
                response.sendRedirect("games");
                return;
            } else {
                System.out.println("update fail");
                response.sendRedirect("editGame?fail=true");
                return;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
                request.setAttribute("authenticated", "true");
            }


            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));

            if (request.getParameter("id") != null) {

                Game game = gameRepository.gameById(Integer.parseInt(request.getParameter("id")));
                gameId = Integer.parseInt(request.getParameter("id"));

                request.setAttribute("game", game);


                getServletContext().getRequestDispatcher(EDIT_GAME).forward(request, response);


            }


        } catch (Exception e) {

        }
    }
}