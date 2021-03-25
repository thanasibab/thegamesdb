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

    <strong><h2>Search For Game</h2></strong><br>
    <form action="games" method = "get">
		<div class="table-responsive">
   <table class="table">
            <tr><td>Name:</td><td><input type="text" name="game_name"></td></tr>
			<tr><td>Genre:</td><td><input type="text" name="genre"></td></tr>
			<tr><td>Release Date:</td><td><input type="text" name="release_date"></td></tr>
			<tr><td>Console:</td><td><input type="text" name="console"></td></tr>
			<tr><td>Publisher:</td><td><input type="text" name="publisher"></td></tr>
			<tr><td>Developer:</td><td><input type="text" name="developer"></td></tr>
			<tr><td>Number Of Players:</td><td><input type="text" name="num_players"></td></tr>
    </table>
		</div>
		<input type="hidden" name="choice" value="true" />
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>

		<script src="<%=request.getContextPath()%>/jquery-1.12.4.js">
		</script>

		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js">
		</script>

</body>
</html>
