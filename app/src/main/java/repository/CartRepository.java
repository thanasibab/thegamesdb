package repository;

import model.CartItem;
import util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class CartRepository {

    private Connection connection;

    public CartRepository() {
        connection = DbUtil.getConnection();
    }

    public void addItem(String userId, int gameId, int quantity) throws SQLException {

        PreparedStatement statement = connection.prepareStatement("INSERT INTO cart (user_id,game_id,quantity)\r\n" +
                "VALUES (?,?,?) ON DUPLICATE KEY UPDATE quantity = quantity+?");
        statement.setString(1, userId);
        statement.setInt(2, gameId);
        statement.setInt(3, quantity);
        statement.setInt(4, quantity);
        statement.executeUpdate();

    }

    public void checkOut(String userId) throws SQLException {
        double total = this.getTotalPrice(userId);
        PreparedStatement statement = connection.prepareStatement("INSERT INTO purchaseHistory (user_id,total,date)\r\n" +
                "VALUES (?,?,?)");

        Calendar calendar = Calendar.getInstance();
        Timestamp created = new Timestamp(calendar.getTime().getTime());

        statement.setString(1, userId);
        statement.setDouble(2, total);
        statement.setTimestamp(3, created);
        statement.executeUpdate();

        this.emptyCart(userId);

    }

    public void emptyCart(String userId) throws SQLException {

        PreparedStatement statement = connection.prepareStatement("DELETE FROM cart WHERE user_id = ?");

        statement.setString(1, userId);
        statement.executeUpdate();

    }

    public double getTotalPrice(String userId) throws SQLException {

        double total = 0;

        PreparedStatement statement = connection.prepareStatement("SELECT\r\n" +
                "Sum(cart.quantity * (game.price - game.discount)) as total\r\n" +
                "FROM\r\n" +
                "cart\r\n" +
                "INNER JOIN game ON cart.game_id = game.game_id\r\n" +
                "WHERE\r\n" +
                "cart.user_id = ?");
        statement.setString(1, userId);
        ResultSet rs = statement.executeQuery();

        if (rs.next()) {
            total = rs.getDouble("total");
        }

        return total;


    }

    public int getTotalItems(String userId) throws SQLException {

        int total = 0;

        PreparedStatement statement = connection.prepareStatement("SELECT\r\n" +
                "Sum(cart.quantity) as total\r\n" +
                "FROM\r\n" +
                "cart\r\n" +
                "WHERE\r\n" +
                "cart.user_id = ?");
        statement.setString(1, userId);
        ResultSet rs = statement.executeQuery();

        if (rs.next()) {
            total = rs.getInt("total");
        }

        return total;

    }

    public void removeItem(String userId, int id) throws SQLException {

        Connection conn = DbUtil.getConnection();
        String query = "DELETE FROM cart WHERE id = ? AND user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        pstmt.setString(2, userId);
        pstmt.executeUpdate();

    }

    public void updateItem(String userId, int id, int qty) throws SQLException {

        Connection conn = DbUtil.getConnection();
        String query = "UPDATE cart SET quantity = ? WHERE id = ? AND user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, qty);
        pstmt.setInt(2, id);
        pstmt.setString(3, userId);
        pstmt.executeUpdate();

    }


    public List<CartItem> items(String userId) throws SQLException {
        List<CartItem> items = new ArrayList<CartItem>();


        PreparedStatement statement = connection.prepareStatement("SELECT\r\n" +
                "cart.id,\r\n" +
                "cart.game_id,\r\n" +
                "cart.quantity,\r\n" +
                "game.game_name,\r\n" +
                "game.price,\r\n" +
                "game.discount\r\n" +
                "FROM\r\n" +
                "cart\r\n" +
                "INNER JOIN game ON cart.game_id = game.game_id"
                + " WHERE cart.user_id = ?");
        statement.setString(1, userId);

        System.out.println(statement);

        ResultSet rs = statement.executeQuery();


        while (rs.next()) {
            CartItem item = new CartItem();
            item.setId(rs.getInt("id"));
            item.setGameId(rs.getInt("game_id"));
            item.setGameName(rs.getString("game_name"));
            item.setQuantity(rs.getInt("quantity"));
            item.setPrice(rs.getDouble("price"));
            item.setDiscount(rs.getDouble("discount"));
            items.add(item);
        }

        return items;
    }

}
