package controller;

import model.Comment;
import model.Game;
import repository.CartRepository;
import repository.CommentRepository;
import repository.GameRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class GameListDisplay extends HttpServlet {

    private static String LIST_GAMES = "/WEB-INF/game/list.jsp";
    private static String DISPLAY_GAME = "/WEB-INF/game/display.jsp";
    private GameRepository gameRepository;
    private CartRepository cartRepository;
    private CommentRepository commentRepository;

    public GameListDisplay() {
        this.gameRepository = new GameRepository();
        this.cartRepository = new CartRepository();
        this.commentRepository = new CommentRepository();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            String userId = "anonymous";

            if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
                request.setAttribute("authenticated", "true");
                userId = (String) session.getAttribute("userId");
            }

            if (request.getParameter("id") != null && request.getParameter("comment") != null) {

                commentRepository.add(userId, Integer.parseInt(request.getParameter("id")), request.getParameter("comment"));
                Game game = gameRepository.gameById(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("game", game);
                request.setAttribute("comments", commentRepository.items(Integer.parseInt(request.getParameter("id"))));
                getServletContext().getRequestDispatcher(DISPLAY_GAME).forward(request, response);


            } else {
                response.getWriter().append("Invalid Request");
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            HttpSession session = request.getSession();

            if (session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
                request.setAttribute("authenticated", "true");
            }

            request.setAttribute("cartTotal", cartRepository.getTotalItems((String) session.getAttribute("userId")));

            if (request.getParameter("id") != null) {

                Game game = gameRepository.gameById(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("game", game);
                request.setAttribute("comments", commentRepository.items(Integer.parseInt(request.getParameter("id"))));
                getServletContext().getRequestDispatcher(DISPLAY_GAME).forward(request, response);


            } else if (request.getParameter("choice") != null) {
                request.setAttribute("games", gameRepository.gameByChoice(request));
                getServletContext().getRequestDispatcher(LIST_GAMES).forward(request, response);

            } else if (request.getParameter("specials") != null && session.getAttribute("authenticated") != null && session.getAttribute("authenticated").equals(true)) {
                request.setAttribute("games", gameRepository.specials());
                getServletContext().getRequestDispatcher(LIST_GAMES).forward(request, response);
            } else {
                request.setAttribute("games", gameRepository.all());
                getServletContext().getRequestDispatcher(LIST_GAMES).forward(request, response);

            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}