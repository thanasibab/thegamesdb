<%@ page import="model.Game" %>
<%@ page import="model.Comment" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<link href="<%=request.getContextPath()%>/assets/css/bootstrap-united.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/css/comments.css" rel="stylesheet" />
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
			<li class="active"><a href="games">Games</a></li>
			<li><a href="search">Search</a></li>
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

	<div class="row">
		<div class="col-md-4">
			<img src="<%=game.getFrontBoxArt()%>" width="300" height="423">
		</div>
		<div class="col-md-8">

			<div class="table-responsive">
				<table class="table">

					<tr>
						<th align="left">Name</th>
						<td><%=game.getGameName()%></td>
					</tr>
					<tr>
						<th align="left">Genre</th>
						<td><%=game.getGenre()%></td>
					</tr>
					<tr>
						<th align="left">Console</th>
						<td><%=game.getConsole()%></td>
					</tr>
					<tr>
						<th align="left">Developer</th>
						<td><%=game.getDeveloper()%></td>
					</tr>
					<tr>
						<th align="left">Publisher</th>
						<td><%=game.getPublisher()%></td>
					</tr>
					<tr>
						<th align="left">Release Date</th>
						<td><%=game.getReleaseDate()%></td>
					</tr>
					<tr>
						<th align="left">Players</th>
						<td><%=game.getNumPlayers()%></td>
					</tr>
					<% if(request.getAttribute("authenticated") != null){ %>
					<tr>
						<th align="left">Price</th>
						<td>$<%=game.getPrice() - game.getDiscount()%></td>
					</tr>
					<tr>
						<th align="left"><font color="red">Applied Discount</font></th>
						<td>$<%=game.getDiscount()%></td>
					</tr>
					<tr>
						<th align="left">Description</th>
						<td><%=game.getGameDescription()%></td>
					</tr>
					<%}else{ %><tr>
					<th align="left">Price</th>
					<td>$<%=game.getPrice()%></td>
				</tr>
					<tr>
						<th align="left">Description</th>
						<td><%=game.getGameDescription()%></td>
					</tr><%} %>


				</table>

		</div>
	</div>

<% if(request.getAttribute("authenticated") != null){ %>
		<form action="cart" method = "post" id="addToCart">
			<input type="hidden" name="game_id" value="<%=game.getGameId()%>" />
			<input class="btn btn-primary" type="submit" value="Add To Cart" />
		</form>
<%} %>

<% if(session.getAttribute("admin") != null){ %>
        <a class="btn btn-primary" href="editGame?id=<%=game.getGameId()%>" role="button">Edit Game</a>
<%} %>
	</div>

<% List <Comment> comments  = null;

    comments=(List<Comment>) request.getAttribute("comments");

%>

    <div class="detailBox">
        <div class="titleBox">
            <label>Comments about <%=game.getGameName()%></label>
            <button type="button" class="close" aria-hidden="true">&times;</button>
        </div>
        <div class="actionBox">
<% if(comments.size() > 0){%>
            <ul class="commentList">
<% for (Comment e : comments){ %>
                <li>
                    <div class="commentText">
                        <p class=""><%=e.getCommentDetails()%></p> <span class="date sub-text">From <mark><%=e.getUserId()%></mark> on <%=e.getCommentDate()%></span>

                    </div>
                </li>
<%}%>
            </ul>
<%} %>
            <form class="form-inline" role="form" method="post">
                <input type="hidden" name="id" value="<%=game.getGameId()%>" />
                <div class="form-group">
                    <input class="form-control" type="text" name="comment" placeholder="Your comments" />
                </div>
                <div class="form-group">
                    <button class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>

</div>

<script src="<%=request.getContextPath()%>/jquery-1.12.4.js">
</script>

<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js">
</script>

<script>
    // Attach a submit handler to the form
    $( "#addToCart" ).submit(function( event ) {

        // Stop form from submitting normally
        event.preventDefault();

        // Get some values from elements on the page:
        var $form = $( this ),
            game_id = <%=game.getGameId()%>,
            qty = 1,
            url = $form.attr( "action" );

        // Send the data using post
        var posting = $.post( url, { game_id: game_id, qty: qty } );

        // Put the results in a div
        posting.done(function( data ) {
            $('#cartTotal').text("Cart (" + data + ")");
        });
    });
</script>

</body>
</html>