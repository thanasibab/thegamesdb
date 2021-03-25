package repository;

import model.CartItem;
import model.Comment;
import util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class CommentRepository {

    private Connection connection;

    public CommentRepository() {
        connection = DbUtil.getConnection();
    }

    public void add(String userId, int gameId, String comment) throws SQLException {

        Calendar calendar = Calendar.getInstance();
        Timestamp created = new Timestamp(calendar.getTime().getTime());

        PreparedStatement statement = connection.prepareStatement("INSERT INTO comments (user_id,game_id,comment_details, comment_date)\r\n" +
                "VALUES (?,?,?,?)");
        statement.setString(1, userId);
        statement.setInt(2, gameId);
        statement.setString(3, comment);
        statement.setTimestamp(4, created);
        statement.executeUpdate();

    }

    public List<Comment> items(int gameId) throws SQLException {
        List<Comment> items = new ArrayList<Comment>();


        PreparedStatement statement = connection.prepareStatement("SELECT * FROM comments WHERE game_id = ?");
        statement.setInt(1, gameId);

        ResultSet rs = statement.executeQuery();


        while (rs.next()) {
            Comment item = new Comment();
            item.setUserId(rs.getString("user_id"));
            item.setCommentDate(rs.getString("comment_date"));
            item.setCommentDetails(rs.getString("comment_details"));
            items.add(item);
        }

        return items;
    }

}
