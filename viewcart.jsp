<%@page import="bean.Cartbean"%>
<%@ page import="java.util.List, "%>
<%
    HttpSession httpsession = request.getSession(false);
    if (session != null) {
        List<Cartbean> cartItems = (List<Cartbean>) session.getAttribute("cartItems");

        if (cartItems != null && !cartItems.isEmpty()) {
%>
<html>
<head>
<title>Your Cart</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<h1>Your Cart</h1>
	<form action="updatecart.jsp" method="post">
		<table>
			<tr>
				<th>Item</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total</th>
				<th>Action</th>
			</tr>
			<% for (Cartbean item : cartItems) { %>
			<tr>
				<td><%= item.getName() %></td>
				<td><%= item.getPrice() %></td>
				<td><input type="number" name="quantity_<%= item.getProductId() %>"
					value="<%= item.getQuantity() %>" min="1"></td>
				<td><%= item.getPrice() * item.getQuantity() %></td>
				<td><a href="deletecart.jsp?itemId=<%= item.getProductId() %>">Remove</a>
				</td>
			</tr>
			<% } %>
		</table>
		<input type="submit" value="Update Cart">
	</form>
	<a href="checkout.jsp">Proceed to Checkout</a>
</body>
</html>
<%
        } else {
%>
<html>
<body>
	<h1>Your cart is empty.</h1>
	<a href="index.jsp">Continue Shopping</a>
</body>
</html>
<%
        }
    } else {
%>
<html>
<body>
	<h1>Session expired. Please log in again.</h1>
	<a href="login.jsp">Login</a>
</body>
</html>
<%
    }
%>
