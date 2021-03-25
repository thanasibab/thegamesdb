package repository;

import model.Game;
import util.DbUtil;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class GameRepository {

    private Connection connection;

    public GameRepository() {
        connection = DbUtil.getConnection();
    }

    public List<Game> gameByChoice(HttpServletRequest request) throws SQLException {
        List<Game> games = new ArrayList<Game>();

        String[] arr = {"game_name", "genre", "release_date", "console", "publisher", "developer", "num_players"};


        String query = "SELECT game_id, game_name FROM game WHERE 1 = 1 ";

        if (request.getParameter(arr[0]) != null && request.getParameter(arr[0]).trim().length() > 0) {
            query += " AND game_name LIKE '%" + request.getParameter(arr[0]) + "%'";
        }
        if (request.getParameter(arr[1]) != null && request.getParameter(arr[1]).trim().length() > 0) {
            query += " AND genre LIKE '%" + request.getParameter(arr[1]) + "%'";
        }
        if (request.getParameter(arr[2]) != null && request.getParameter(arr[2]).trim().length() > 0) {
            query += " AND release_date LIKE '%" + request.getParameter(arr[2]) + "%'";
        }
        if (request.getParameter(arr[3]) != null && request.getParameter(arr[3]).trim().length() > 0) {
            query += " AND console LIKE '%" + request.getParameter(arr[3]) + "%'";
        }
        if (request.getParameter(arr[4]) != null && request.getParameter(arr[4]).trim().length() > 0) {
            query += " AND publisher LIKE '%" + request.getParameter(arr[4]) + "%'";
        }
        if (request.getParameter(arr[5]) != null && request.getParameter(arr[5]).trim().length() > 0) {
            query += " AND developer LIKE '%" + request.getParameter(arr[5]) + "%'";
        }
        if (request.getParameter(arr[6]) != null && request.getParameter(arr[6]).trim().length() > 0) {
            query += " AND num_players = " + request.getParameter(arr[6]);
        }

        PreparedStatement statement = connection.prepareStatement(query);

        System.out.println(statement);

        ResultSet rs = statement.executeQuery();


        while (rs.next()) {
            Game game = new Game();
            game.setGameId(rs.getInt("game_id"));
            game.setGameName(rs.getString("game_name"));
            games.add(game);
        }

        return games;
    }

    public List<Game> all() throws SQLException {
        List<Game> games = new ArrayList<Game>();

        PreparedStatement statement = connection.prepareStatement("SELECT game_id, game_name FROM game");
        ResultSet rs = statement.executeQuery();


        while (rs.next()) {
            Game game = new Game();
            game.setGameId(rs.getInt("game_id"));
            game.setGameName(rs.getString("game_name"));
            games.add(game);
        }

        return games;
    }

    public List<Game> specials() throws SQLException {
        List<Game> games = new ArrayList<Game>();

        PreparedStatement statement = connection.prepareStatement("SELECT game_id, game_name FROM game WHERE discount != 0");
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            Game game = new Game();
            game.setGameId(rs.getInt("game_id"));
            game.setGameName(rs.getString("game_name"));
            games.add(game);
        }

        return games;
    }

    public Game gameById(int gameId) throws SQLException {
        Game game = new Game();
        PreparedStatement preparedStatement = connection.
                prepareStatement("SELECT * FROM game WHERE game_id=?");
        preparedStatement.setInt(1, gameId);
        ResultSet rs = preparedStatement.executeQuery();

        if (rs.next()) {

            game.setGameId(rs.getInt("game_id"));
            game.setGameName(rs.getString("game_name"));
            game.setGameDescription(rs.getString("game_description"));
            game.setConsole(rs.getString("console"));
            game.setDeveloper(rs.getString("developer"));
            game.setGenre(rs.getString("genre"));
            game.setReleaseDate(rs.getDate("release_date"));
            game.setNumPlayers(rs.getString("num_players"));
            game.setPrice(rs.getDouble("price"));
            game.setPublisher(rs.getString("publisher"));
            game.setDiscount(rs.getDouble("discount"));
            game.setDiscount(rs.getDouble("discount"));
            game.setFrontBoxArt(rs.getString("front_box_art"));
        }

        return game;
    }

    public Boolean updateGame(HttpServletRequest request, int id) throws SQLException {

        String[] arr = {"discount", "gameName", "gameDescription", "console", "numPlayers", "coop", "genre", "releaseDate", "developer", "publisher", "price"};

        int gameId = id;

        Game game = gameById(id);

        if (request.getParameter(arr[0]) != null) {
            game.setDiscount(Double.parseDouble(request.getParameter(arr[0])));
        }
        if (request.getParameter(arr[1]) != null) {
            game.setGameName(request.getParameter(arr[1]));
        }
        if (request.getParameter(arr[2]) != null) {
            game.setGameDescription(request.getParameter(arr[2]));
        }
        if (request.getParameter(arr[3]) != null) {
            game.setConsole(request.getParameter(arr[3]));
        }
        if (request.getParameter(arr[4]) != null) {
            game.setNumPlayers(request.getParameter(arr[4]));
        }
        if (request.getParameter(arr[5]) != null) {
            game.setCoop(request.getParameter(arr[5]));
        }
        if (request.getParameter(arr[6]) != null) {
            game.setGenre(request.getParameter(arr[6]));
        }
        if (request.getParameter(arr[8]) != null) {
            game.setDeveloper(request.getParameter(arr[8]));
        }
        if (request.getParameter(arr[9]) != null) {
            game.setPublisher(request.getParameter(arr[9]));
        }
        if (request.getParameter(arr[10]) != null) {
            game.setPrice(Double.parseDouble(request.getParameter(arr[10])));
        }


        boolean check = false;


        // Check if user exists
        if (!check) {

            Calendar calendar = Calendar.getInstance();
            java.sql.Timestamp lastLogin = new java.sql.Timestamp(calendar.getTime().getTime());
            java.sql.Timestamp created = new java.sql.Timestamp(calendar.getTime().getTime());

            String query2 = "UPDATE game SET game_name = ?, game_description = ?, console = ?, num_players= ?, coop= ?, genre= ?, developer= ?, publisher= ?,"
                    + "price=?, discount =? WHERE game_id = ? ";

            PreparedStatement pstmt2 = connection.prepareStatement(query2);
            pstmt2.setString(1, game.getGameName());
            pstmt2.setString(2, game.getGameDescription());
            pstmt2.setString(3, game.getConsole());
            pstmt2.setString(4, game.getNumPlayers());
            pstmt2.setString(5, game.getCoop());
            pstmt2.setString(6, game.getGenre());
            pstmt2.setString(7, game.getDeveloper());
            pstmt2.setString(8, game.getPublisher());
            pstmt2.setDouble(9, game.getPrice());
            pstmt2.setDouble(10, game.getDiscount());
            pstmt2.setInt(11, id);
            pstmt2.executeUpdate();

            return true;
        }

        return false;

    }

    public boolean addFavorite(int game_id, String user_id) throws SQLException {

        PreparedStatement pstmt;

        String query2 = "SELECT * FROM favorites WHERE user_id = ? and game_id= ?";
        pstmt = connection.prepareStatement(query2);
        pstmt.setString(1, user_id);
        pstmt.setInt(2, game_id);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            return false;
        }

        String query = "INSERT INTO favorites (user_id, game_id)\r\n" +
                "VALUES (?, ?)";

        pstmt = connection.prepareStatement(query);
        pstmt.setString(1, user_id);
        pstmt.setInt(2, game_id);
        pstmt.executeUpdate();

        return true;
    }

    public List<Game> allFavorites(String user_id) throws SQLException {

        List<Game> games = new ArrayList<Game>();

        PreparedStatement statement = connection.prepareStatement("SELECT game.game_id, game.game_name, favorites.game_id FROM game , favorites WHERE game.game_id = favorites.game_id AND favorites.user_id = ?");
        statement.setString(1, user_id);
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            Game game = new Game();
            game.setGameId(rs.getInt("game_id"));
            game.setGameName(rs.getString("game_name"));
            games.add(game);
        }

        return games;
    }

    public void removeFavorite(int game_id, String user_id) throws SQLException {

        PreparedStatement statement = connection.prepareStatement("DELETE FROM favorites\r\n" +
                "WHERE user_id = ? AND game_id = ?");
        statement.setString(1, user_id);
        statement.setInt(2, game_id);
        statement.executeUpdate();

    }
}