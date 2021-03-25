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
            <li><a href="search">Search</a></li>
<% if(session.getAttribute("admin") != null){ %>
            <li><a href="loginHistory">Login History</a></li>
            <li><a href="purchaseHistory">Purchase History</a></li>
<% } %>
<% if(request.getAttribute("authenticated") != null){ %>
            <li><a href="update">Edit Profile</a></li>
            <li><a href="favorites">Favorites</a></li>
            <li><a href="games?specials=true">Specials</a></li>
            <li class="active"><a href="cart" id="cartTotal">Cart (<%=request.getAttribute("cartTotal")%>)</a></li>
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

    <strong><h2>Checkout</h2></strong><br>
    <strong><% if(request.getParameter("fail") != null) {%> <%= "Your credit card cannot be validated, please try again" %><%} %></strong>
    <strong><% if(request.getParameter("success") != null) {%> <%= "Your order has been submitted successfully" %><%} %></strong>

<%if(request.getParameter("success") == null || request.getParameter("success").isEmpty()) {%>
    <form action="checkout" method = "post">
        <table class="table">
            <tr><td>Credit Card Number:</td><td><input type="text" name="creditNumber"></td></tr>
            <tr><td>Credit Card CVV:</td><td><input type="text" name="creditCvv"></td></tr>

        </table><br/>
        <input class="btn btn-primary" type="submit" value="confirm" />
<%} %>

</div>

<script src="<%=request.getContextPath()%>/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>


</body>
</html>