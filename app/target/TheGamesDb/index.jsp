<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    if (session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals(true))
    {
        request.setAttribute("authenticated", "true");
    }

%>
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
            <li class="active"><a href="<%=request.getContextPath()%>">Home</a></li>
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
    <div class="jumbotron">
        <div>
            <h1>Welcome to The Games DB!</h1>
            <p>To get started, enter your details to register.
                Or login to access your details, if you are already registered.</p>
        </div>

        <a class="btn btn-primary" href="games">Games</a>
        <a class="btn btn-primary" href="search">Search</a>
        <% if(request.getAttribute("authenticated") != null){ %>
        <a class="btn btn-primary" href="games?specials=true">Specials</a>
        <%}else{ %>
        <a class="btn btn-primary" href="register">Register</a>
        <a class="btn btn-primary" href="login">Login</a>
        <%} %>
    </div>

    <div></div>
</div>
<script src="<%=request.getContextPath()%>/jquery-1.12.4.js">
</script>

<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js">
</script>

</body>
</html>
