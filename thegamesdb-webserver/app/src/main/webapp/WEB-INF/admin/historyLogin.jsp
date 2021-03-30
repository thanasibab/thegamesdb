<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap-united.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
    <style>
        body {
            height: 100%;
            margin: 0;
            display: compact;
        }
    </style>
</head>
<body>

<div class="navbar navbar-default">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-responsive-collapse">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span>
        </button>
    </div>

    <div class="navbar-collapse collapse navbar-responsive-collapse">


        <ul class="nav navbar-nav navbar-right">
            <li><a href="<%=request.getContextPath()%>">Home</a></li>
            <li><a href="games">Games</a></li>
            <li><a href="search">Search</a></li>
<% if(session.getAttribute("admin") != null){ %>
            <li class="active"><a href="loginHistory">Login History</a></li>
            <li><a href="purchaseHistory">Purchase History</a></li>
<% } %>
<% if(request.getAttribute("authenticated") != null){ %>
            <li><a href="update">Edit Profile</a></li>
            <li><a href="favorites">Favorites</a></li>
            <li><a href="games?specials=true">Specials</a></li>
            <li><a href="cart" id="cartTotal">Cart (<%=request.getAttribute("cartTotal")%>)</a></li>
            <li><a href="logout">Logout</a></li>
<%}else{ %>
            <li><a href="register">Register</a></li>
            <li><a href="login">Login</a></li>
<%} %>
        </ul>
    </div>
    <!-- /.nav-collapse -->
</div>

<div class="container">

<% List <User> users  = null;
        users= (List<User>) request.getAttribute("users");

        if(users.size() == 0){%>
    <br><br>Login History is currently empty
<% }else{

%>

    <h3>Login History</h3>
    <table class="table">
        <tr>
            <td><b>User</b></td>
            <td><b>Last Login</b></td>
            <td><b>Account status</b></td>
            <td><b>Block/Unblock</b></td>


        </tr>
<% for (User e : users){ %>
        <tr>
            <td><%=e.getUserId()%></td>
            <td><%=e.getLastLogin()%></td>
<%if(e.getLocked() == 3){%>
            <td id="user<%=e.getUserId()%>">Locked</td>
<%}else{%>
            <td id="user<%=e.getUserId()%>">Unlocked</td>
<%} %>
            <td><button class="btn btn-primary" id="lockBtn<%=e.getUserId()%>" style="width:100%" onclick="toggle('<%=e.getUserId()%>')"><%=(e.getLocked() == 3 ? "Unblock":"Block")%></button></td>
<%} %>
        </tr>
    </table>
<% } %>


</div>

<script src="<%=request.getContextPath()%>/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script>

    function toggle(id)
    {
        // Send the data using post
        $.post( "update", { toggle: "true", user_id: id })
            .done(function( data, status ) {

                if (status == "success") {
                    $('#user'+id).text(data.lockStatus);
                    if (data.lockStatus == "Locked") {
                        $('#lockBtn'+id).text("Unblock");
                    }
                    else {
                        $('#lockBtn'+id).text("Block");
                    }
                }
                else {
                    alert("Could not locker user = " + id);
                }
            });

    }

</script>

</body>
</html>