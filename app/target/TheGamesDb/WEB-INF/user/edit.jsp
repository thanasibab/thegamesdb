<%@ page import="model.User" %>
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
            <li class="active"><a href="update">Edit Profile</a></li>
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

<% User user  = null;
    user =(User) request.getAttribute("user");
%>

    <strong><h2>Edit Profile</h2></strong>
    <strong><% if(request.getParameter("fail") != null) {%> <%= "Username already taken!" %><%} %></strong>
    <form action="update" method = "post">
        <table class="table">
            <tr><td>First Name:</td><td><input type="text" name="firstName" value="<%=user.getFirstName()%>"></td></tr>
            <tr><td>Last Name:</td><td><input type="text" name="lastName" value = "<%=user.getLastName() %>" ></td></tr>
            <tr><td>Username:</td><td><input type="text" name="userId" value = "<%=user.getUserId()%>"></td></tr>
            <tr><td>Password:</td><td><input type="password" name="password"  value = "<%=user.getPassword()%>"></td></tr>
            <tr><td>Email:</td><td><input type="text" name="email" value = "<%=user.getEmail()%>"></td></tr>
            <tr><td>Address 1:</td><td><input type="text" name="address1" value = "<%=user.getAddress1()%>"></td></tr>
            <tr><td>Address 2:</td><td><input type="text" name="address2" value = "<%=user.getAddress2()%>"></td></tr>
            <tr><td>City:</td><td><input type="text" name="city" value = "<%=user.getCity()%>"></td></tr>
            <tr><td>State:</td><td><input type="text" name="state" value = "<%=user.getState()%>"></td></tr>
            <tr><td>Country:</td><td><input type="text" name="country" value = "<%=user.getCountry()%>"></td></tr>
            <tr><td>Postal Code:</td><td><input type="text" name="zip" value = "<%=user.getZip()%>"></td></tr>
            <tr><td>Credit-Card Type:</td><td><input type="text" name="creditType" value = "<%=user.getCreditCardType()%>"></td></tr>
            <tr><td>Credit-Card CVV:</td><td><input type="text" name="creditCVV" value = "<%=user.getCreditCardCvv()%>"></td></tr>
            <tr><td>Credit-Card Expiry:</td><td><input type="text" name="creditExpiry" value = "<%=user.getCreditCardExpiry()%>"></td></tr>

        </table><br/>

        <input class="btn btn-primary" type="submit" value="Update" />

    </form>

</div>

<script src="<%=request.getContextPath()%>/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>


</body>
</html>