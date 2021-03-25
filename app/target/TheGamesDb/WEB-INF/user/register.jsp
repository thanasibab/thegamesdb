<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap-united.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.css" rel="stylesheet"/>
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
            <% if (request.getAttribute("authenticated") != null) { %>
            <li><a href="games?specials=true">Specials</a></li>
            <li><a href="logout">Logout</a></li>
            <%} else { %>
            <li class="active"><a href="register">Register</a></li>
            <li><a href="login">Login</a></li>
            <%} %>
        </ul>
    </div>
    <!-- /.nav-collapse -->
</div>
<div class="container">

    <strong><% if (request.getParameter("fail") != null) {%> <%= "Username already taken!" %><%} %></strong>
    <form class="form-signin" action="register" method="post">
        <h2 class="form-signin-heading">Please sign up</h2>
        <table class="table">
            <tr>
                <td>First Name:</td>
                <td><input type="text" name="firstName" required></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastName" required></td>
            </tr>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="userId" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" required></td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td><input type="text" name="address1"></td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td><input type="text" name="address2"></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><input type="text" name="city"></td>
            </tr>
            <tr>
                <td>State:</td>
                <td><input type="text" name="state"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" name="country"></td>
            </tr>
            <tr>
                <td>Postal Code:</td>
                <td><input type="text" name="zip"></td>
            </tr>
            <tr>
                <td>Credit-Card Type:</td>
                <td><input type="text" name="creditType"></td>
            </tr>
            <tr>
                <td>Credit-Card CVV:</td>
                <td><input type="text" name="creditCVV"></td>
            </tr>
            <tr>
                <td>Credit-Card Expiry:</td>
                <td><input type="text" name="creditExpiry"></td>
            </tr>

        </table>
        <br/>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>

    </form>

</div> <!-- /container -->

<script src="<%=request.getContextPath()%>/jquery-1.12.4.js">
</script>

<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js">
</script>

</body>
</html>