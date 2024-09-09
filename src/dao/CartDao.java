package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import bean.Cartbean;

import java.util.ArrayList;


public class CartDao {

	private Connection connection;

	public CartDao(Connection connection) {
		this.connection = connection;
	}

	// Method to add an item to the cart
	public void addItemToCart(int userId, int productId, int quantity) throws SQLException {
		String sql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?) "
				+ "ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)";
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, userId);
			statement.setInt(2, productId);
			statement.setInt(3, quantity);
			statement.executeUpdate();
		}
	}

	// Method to get all items in the cart for a user
	public List<Cartbean> getCartItems(int userId) throws SQLException {
		List<Cartbean> cartItems = new ArrayList<>();
		String sql = "SELECT c.product_id, p.name, p.price, c.quantity "
				+ "FROM cart c JOIN products p ON c.product_id = p.id " + "WHERE c.user_id = ?";
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, userId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				cartItems.add(new Cartbean(resultSet.getInt("product_id"), resultSet.getString("name"),
						resultSet.getDouble("price"), resultSet.getInt("quantity")));
			}
		}
		return cartItems;
	}

	// Method to update the quantity of an item in the cart
	public void updateCartItem(int userId, int productId, int quantity) throws SQLException {
		String sql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, quantity);
			statement.setInt(2, userId);
			statement.setInt(3, productId);
			statement.executeUpdate();
		}
	}

	// Method to remove an item from the cart
	public void removeItemFromCart(int userId, int productId) throws SQLException {
		String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, userId);
			statement.setInt(2, productId);
			statement.executeUpdate();
		}
	}

	// Method to clear the cart for a user
	public void clearCart(int userId) throws SQLException {
		String sql = "DELETE FROM cart WHERE user_id = ?";
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, userId);
			statement.executeUpdate();
		}
	}
}
