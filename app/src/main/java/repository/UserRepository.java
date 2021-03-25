package repository;

import model.Purchase;
import model.User;
import util.DbUtil;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class UserRepository {

    private Connection connection;

    public UserRepository() {
        connection = DbUtil.getConnection();
    }

    public static void incrementLock(String user, int count) throws SQLException {


        Connection conn = DbUtil.getConnection();
        String query = "UPDATE user SET locked = ? WHERE user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, count);
        pstmt.setString(2, user);
        pstmt.executeUpdate();

    }

    public void resetPass(String user, String pass) throws SQLException {

        String query = ("UPDATE user SET password = '" + pass + "', tempPass = '1' WHERE user_id ='" + user + "'");
        PreparedStatement p = connection.prepareStatement(query);
        p.executeUpdate();

    }

    public Boolean updateUser(HttpServletRequest request, String id) throws SQLException {

        String[] arr = {"firstName", "lastName", "userId", "password", "email", "address1", "address2", "city", "state", "country", "zip", "creditType", "creditCVV", "creditExpiry"};

        String userId = id;

        User user = this.userById(id);

        if (request.getParameter(arr[0]) != null) {
            user.setFirstName(request.getParameter(arr[0]));
        }
        if (request.getParameter(arr[1]) != null) {
            user.setLastName(request.getParameter(arr[1]));
        }
        if (request.getParameter(arr[2]) != null) {
            user.setUserId(request.getParameter(arr[2]));
            userId = (String) request.getParameter(arr[2]);
        }
        if (request.getParameter(arr[3]) != null) {
            user.setPassword(request.getParameter(arr[3]));
        }
        if (request.getParameter(arr[4]) != null) {
            user.setEmail(request.getParameter(arr[4]));
        }
        if (request.getParameter(arr[5]) != null) {
            user.setAddress1(request.getParameter(arr[5]));
        }
        if (request.getParameter(arr[6]) != null) {
            user.setAddress2(request.getParameter(arr[6]));
        }
        if (request.getParameter(arr[7]) != null) {
            user.setCity(request.getParameter(arr[7]));
        }
        if (request.getParameter(arr[8]) != null) {
            user.setState(request.getParameter(arr[8]));
        }
        if (request.getParameter(arr[9]) != null) {
            user.setCountry(request.getParameter(arr[9]));
        }
        if (request.getParameter(arr[10]) != null) {
            user.setZip(request.getParameter(arr[10]));
        }
        if (request.getParameter(arr[11]) != null) {
            user.setCreditCardType(request.getParameter(arr[11]));
        }
        if (request.getParameter(arr[12]) != null) {
            user.setCreditCardCvv(request.getParameter(arr[12]));
        }
        if (request.getParameter(arr[13]) != null) {
            user.setCreditCardExpiry(request.getParameter(arr[13]));
        }

        boolean check = false;

        if (user.getUserId().equals(id)) {

        } else {
            check = checkUser(user.getUserId());
        }
        // Check if user exists
        if (!check) {

            Calendar calendar = Calendar.getInstance();
            java.sql.Timestamp lastLogin = new java.sql.Timestamp(calendar.getTime().getTime());
            java.sql.Timestamp created = new java.sql.Timestamp(calendar.getTime().getTime());

            String query2 = "UPDATE user SET user_id = ?, password = ?, firstname= ?, lastname= ?, email= ?, address1= ?, address2= ?, city= ?, state= ?, zip= ?, country= ?, credit_card_type= ?, credit_card_cvv= ?"
                    + ", credit_card_expiry= ?, last_login = ?, created = ? "
                    + "WHERE user_id = ? ";

            PreparedStatement pstmt2 = connection.prepareStatement(query2);
            pstmt2.setString(1, user.getUserId());
            pstmt2.setString(2, user.getPassword());
            pstmt2.setString(3, user.getFirstName());
            pstmt2.setString(4, user.getLastName());
            pstmt2.setString(5, user.getEmail());
            pstmt2.setString(6, user.getAddress1());
            pstmt2.setString(7, user.getAddress2());
            pstmt2.setString(8, user.getCity());
            pstmt2.setString(9, user.getState());
            pstmt2.setString(10, user.getZip());
            pstmt2.setString(11, user.getCountry());
            pstmt2.setString(12, user.getCreditCardType());
            pstmt2.setString(13, user.getCreditCardCvv());
            pstmt2.setString(14, user.getCreditCardExpiry());
            pstmt2.setTimestamp(15, lastLogin);
            pstmt2.setTimestamp(16, created);
            pstmt2.setString(17, id);
            pstmt2.executeUpdate();

            return true;
        }

        return false;

    }

    public boolean addUser(HttpServletRequest request) throws SQLException {


        String[] arr = {"firstName", "lastName", "userId", "password", "email", "address1", "address2", "city", "state", "country", "zip", "creditType", "creditCVV", "creditExpiry"};

        User user = new User();

        user.setUserId(request.getParameter(arr[2]));
        user.setPassword(request.getParameter(arr[3]));

        if (request.getParameter(arr[0]) != null) {
            user.setFirstName(request.getParameter(arr[0]));
        }
        if (request.getParameter(arr[1]) != null) {
            user.setLastName(request.getParameter(arr[1]));
        }
        if (request.getParameter(arr[4]) != null) {
            user.setEmail(request.getParameter(arr[4]));
        }
        if (request.getParameter(arr[5]) != null) {
            user.setAddress1(request.getParameter(arr[5]));
        }
        if (request.getParameter(arr[6]) != null) {
            user.setAddress2(request.getParameter(arr[6]));
        }
        if (request.getParameter(arr[7]) != null) {
            user.setCity(request.getParameter(arr[7]));
        }
        if (request.getParameter(arr[8]) != null) {
            user.setState(request.getParameter(arr[8]));
        }
        if (request.getParameter(arr[9]) != null) {
            user.setCountry(request.getParameter(arr[9]));
        }
        if (request.getParameter(arr[10]) != null) {
            user.setZip(request.getParameter(arr[10]));
        }
        if (request.getParameter(arr[11]) != null) {
            user.setCreditCardType(request.getParameter(arr[11]));
        }
        if (request.getParameter(arr[12]) != null) {
            user.setCreditCardCvv(request.getParameter(arr[12]));
        }
        if (request.getParameter(arr[13]) != null) {
            user.setCreditCardExpiry(request.getParameter(arr[13]));
        }

        // Check if user exists
        if (!checkUser(user.getUserId())) {

            Calendar calendar = Calendar.getInstance();
            java.sql.Timestamp lastLogin = new java.sql.Timestamp(calendar.getTime().getTime());
            java.sql.Timestamp created = new java.sql.Timestamp(calendar.getTime().getTime());

            String query = "INSERT INTO user (user_id, password, firstname, lastname, email, address1, address2, city, state, zip, country, credit_card_type, credit_card_cvv, credit_card_expiry, last_login, created)"
                    + " values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?)";

            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getFirstName());
            pstmt.setString(4, user.getLastName());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getAddress1());
            pstmt.setString(7, user.getAddress2());
            pstmt.setString(8, user.getCity());
            pstmt.setString(9, user.getState());
            pstmt.setString(10, user.getZip());
            pstmt.setString(11, user.getCountry());
            pstmt.setString(12, user.getCreditCardType());
            pstmt.setString(13, user.getCreditCardCvv());
            pstmt.setString(14, user.getCreditCardExpiry());
            pstmt.setTimestamp(15, lastLogin);
            pstmt.setTimestamp(16, created);
            pstmt.execute();

            return true;

        }

        return false;

    }

    public boolean checkUser(String user) throws SQLException {

        String query = "SELECT user_id FROM user WHERE user_id = ? ";

        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, user);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            System.out.println("user exists");
            return true;
        } else {
            System.out.println("user does not exist");
            return false;
        }

    }

    public String authenticate(String user, String password) throws SQLException {

        // perform input validation to detect attacks
        String query = "SELECT password, type, tempPass, locked FROM user WHERE user_id = ? ";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, user);
        ResultSet rs = pstmt.executeQuery();
        long currentTime = System.currentTimeMillis();
        password = password.trim();
        String[] pass = password.split("-");
        int counter = 0;

        if (rs.next()) {

            counter = rs.getInt("locked");

            if (rs.getString("password").equals(password)) {
                Calendar calendar = Calendar.getInstance();
                java.sql.Timestamp lastLogin = new java.sql.Timestamp(calendar.getTime().getTime());
                query = "UPDATE user SET tempPass = '0', locked = '0', last_login = ? WHERE user_id = ?";
                counter = 0;
                pstmt = connection.prepareStatement(query);
                pstmt.setTimestamp(1, lastLogin);
                pstmt.setString(2, user);
                pstmt.execute();
                if (rs.getString("type").equals("1")) {
                    return "success-admin";
                } else {
                    return "success-user";
                }
            } else {

                if (rs.getInt("locked") == 3) {

                    System.out.println("This account is locked");
                    return "locked";

                }

                if (rs.getString("tempPass").equals("1")) {

                    if (Long.parseLong(pass[1]) - 86400000 > currentTime) {

                        System.out.println("Exceeded 24h time limit");
                        return "late";

                    }
                }

                counter++;
                incrementLock(user, counter);

                if (counter > 2) {

                    System.out.println("too many attempts, account has been locked!");
                    return "locked";

                }
                System.out.println("Wrong username");
                System.out.println("value of counter: " + counter);
                return "fail";
            }

        } else {
            return "fail";
        }
    }

    public List<User> all() throws SQLException {

        java.text.SimpleDateFormat sdf =
                new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        List<User> users = new ArrayList<User>();

        PreparedStatement statement = connection.prepareStatement("SELECT user_id, last_login, locked FROM user");
        ResultSet rs = statement.executeQuery();


        while (rs.next()) {
            User user = new User();
            System.out.println("user = " + rs.getString("user_id"));
            user.setUserId(rs.getString("user_id"));
            user.setLocked(rs.getInt("locked"));
            user.setLastLogin(sdf.format(rs.getTimestamp("last_login")));
            System.out.println(sdf.format(rs.getTimestamp("last_login")));
            users.add(user);
        }

        return users;
    }

    public List<Purchase> allPurchases() throws SQLException {

        List<Purchase> purchases = new ArrayList<Purchase>();

        PreparedStatement statement = connection.prepareStatement("SELECT user_id, date, total FROM purchaseHistory");
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            Purchase purchase = new Purchase();
            purchase.setUserId(rs.getString("user_id"));
            purchase.setTotalPrice(rs.getInt("total"));
            purchase.setDate(rs.getTimestamp("date"));
            purchases.add(purchase);
        }

        return purchases;
    }

    public User userById(String userId) throws SQLException {
        User user = new User();
        PreparedStatement pstmt = connection.
                prepareStatement("SELECT * FROM user WHERE user_id=?");
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {

            user.setAddress1(rs.getString("address1"));
            user.setAddress2(rs.getString("address2"));
            user.setCity(rs.getString("city"));
            user.setCountry(rs.getString("country"));
            user.setCreditCardCvv(rs.getString("credit_card_cvv"));
            user.setCreditCardExpiry(rs.getString("credit_card_expiry"));
            user.setCreditCardType(rs.getString("credit_card_type"));
            user.setEmail(rs.getString("email"));
            user.setFirstName(rs.getString("firstname"));
            user.setZip(rs.getString("zip"));
            user.setUserId(rs.getString("user_id"));
            user.setState(rs.getString("state"));
            user.setPassword(rs.getString("password"));
            user.setLastName(rs.getString("lastname"));
            user.setLocked(rs.getInt("locked"));

        }

        return user;
    }

    public String changeLock(String id) throws SQLException {

        String status = "";
        int lock = 3;
        int unlock = 0;

        System.out.println("getting infor for user = " + id);

        User user = userById(id);
        int current = user.getLocked();

        System.out.println("current = " + current);

        Connection conn = DbUtil.getConnection();
        String query = "UPDATE user SET locked = ? WHERE user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);

        if (current == 3) {
            pstmt.setInt(1, unlock);

            status = "Unlocked";
        } else {
            pstmt.setInt(1, lock);
            status = "Locked";
        }
        pstmt.setString(2, id);
        pstmt.executeUpdate();

        return status;

    }

}