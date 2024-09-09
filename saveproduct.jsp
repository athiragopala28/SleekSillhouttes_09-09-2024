<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao" %>
<%@ page import="bean.Product" %>

<%
    // Fetch form parameters
    String productName = request.getParameter("productName");
    int collectionId = Integer.parseInt(request.getParameter("collection"));
    int price = Integer.parseInt(request.getParameter("price"));
    String imageUrl = request.getParameter("imageUrl");
    String description = request.getParameter("description");

    // Create Product instance
    Product product = new Product();
    product.setProductName(productName);
    product.setCollectionId(collectionId);
    product.setPrice(price);
    product.setImageUrl(imageUrl);
    product.setDescription(description);

    // Create ProductDao instance
    ProductDao productDao = new ProductDao();

    // Insert product into the database
    boolean isInserted = productDao.insertProduct(product);

    // Redirect with a message
    if (isInserted) {
        response.sendRedirect("addproduct.jsp?message=Product+added+successfully&type=success");
    } else {
        response.sendRedirect("addproduct.jsp?message=Failed+to+add+product&type=danger");
    }
%>
