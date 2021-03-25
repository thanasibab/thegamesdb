<%@ page import="model.Game" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <li class="active"><a href="search">Search</a></li>
<% if(session.getAttribute("admin") != null){ %>
            <li><a href="loginHistory">Login History</a></li>
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

<% Game game  = null;
    game =(Game) request.getAttribute("game");
%>

    <strong><h2>Edit Game</h2></strong>
    <form action="editGame" method = "post">
        <table class="table">
            <tr><td>Game Name:</td><td><input type="text" name="gameName" value="<%=game.getGameName()%>"></td></tr>
            <tr><td>Genre:</td><td><input type="text" name="genre" value = "<%=game.getGenre() %>" ></td></tr>
            <tr><td>Number of players:</td><td><input type="text" name="numPlayer" value = "<%=game.getNumPlayers()%>"></td></tr>
            <tr><td>Console:</td><td><input type="text" name="console"  value = "<%=game.getConsole()%>"></td></tr>
            <tr><td>Price:</td><td><input type="text" name="price" value = "<%=game.getPrice()%>"></td></tr>
            <tr><td>Discount:</td><td><input type="text" name="discount" value = "<%=game.getDiscount()%>"></td></tr>
            <tr><td>Publisher:</td><td><input type="text" name="publisher" value = "<%=game.getPublisher()%>"></td></tr>
            <tr><td>Developer:</td><td><input type="text" name="developer" value = "<%=game.getDeveloper()%>"></td></tr>
            <tr><td>Description:</td><td><input type="text" name="description" value = "<%=game.getGameDescription()%>"></td></tr>
        </table><br/>

        <input class="btn btn-primary" type="submit" value="Update" />

    </form>

</div>

<script src="<%=request.getContextPath()%>/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>


</body>
</html>