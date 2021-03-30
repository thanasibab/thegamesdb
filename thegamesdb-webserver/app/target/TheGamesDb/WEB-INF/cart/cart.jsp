<%@ page import="model.CartItem" %>
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

<%
		List <CartItem> items = (List<CartItem>) request.getAttribute("items");

		if(items.size() == 0){%>
	<br><br>Shopping cart is empty...
<% }else{ %>
	<h3>Shopping Cart</h3>
	<table id="cartItems" class="table">
		<tr>
			<td><b>Name</b></td>
			<td><b>Quantity</b></td>
			<td><b>Price</b></td>
			<td><b>Discount</b></td>
			<td colspan="2"></td>
		</tr>
<% for (CartItem e : items){ %>
		<tr id="row<%=e.getId()%>">
			<td><%=e.getGameName()%></td>
			<td><input type="text" id="qty<%=e.getId()%>" value="<%=e.getQuantity()%>"/></td>
			<td>$<%=e.getPrice()%></td>
			<td>$<%=e.getDiscount()%></td>
			<td><button class="btn btn-primary" onclick="updateQty(<%=e.getId()%>)">Update</button></td>
			<td><button class="btn btn-primary" onclick="delItem(<%=e.getId()%>)">Remove Item</button></td>
<% } %></tr>
		<tr>
			<td></td>
			<td><b>Total:</b></td>
			<td id="totalSum"><b>$<%=request.getAttribute("cartTotalPrice")%></b></td>
			<td colspan = "3"></td>
		</tr>
	</table>
	<button class="btn btn-primary" onclick="location.href='checkout'">Checkout</button>
<% } %>

</div>

<script src="<%=request.getContextPath()%>/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script>

    function updateQty(id)
    {
        // Send the data using post
        $.post( "cart", { update: "true", item_id: id, qty: $('#qty'+id).val()})
            .done(function( data, status ) {

                if (status == "success") {
                    $('#cartTotal').text("Cart (" + data.cartTotal + ")");
                    $("#totalSum").text('$' + parseFloat(data.cartTotalPrice, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString());
                    console.log('updated qty for game_id=' + id + " to new value: " + data.cartTotal);
                }
                else {
                    alert("Could not update item id = " + id);
                }


            })

    }

    function delItem(id)
    {

        $.post( "cart", {delete: "true", item_id: id })
            .done(function( data, status ) {

                if (status == "success") {
                    $('#row'+id).remove();
                    $('#cartTotal').text("Cart (" + data.cartTotal + ")");
                    $("#totalSum").text('$' + parseFloat(data.cartTotalPrice, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString());
                }
                else {
                    alert("Could not remove item id = " + id);
                }

            })
    }


</script>

</body>
</html>