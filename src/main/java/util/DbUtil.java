package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {

    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String databaseUrl = "jdbc:mysql://thegamesdb-sql.mysql.database.azure.com:3306/thegamesdb";
                String databaseUser = "thegamesdb";
                String databasePass = "gamesdb1!";

                connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePass);

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return connection;
        }

    }
}