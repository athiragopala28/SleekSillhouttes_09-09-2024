<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao" %>
<%@ page import="bean.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Update Product</h2>

        <%
            // Retrieve the product ID from the request parameter
            String idParam = request.getParameter("id");

            if (idParam == null || idParam.isEmpty()) {
                out.println("<div class='alert alert-danger'>Product ID is missing.</div>");
            } else {
                int productId = Integer.parseInt(idParam);
                ProductDao productDao = new ProductDao();
                Product product = productDao.getProductById(productId);

                if (product == null) {
                    out.println("<div class='alert alert-danger'>Product not found.</div>");
                } else {
                    // Check if form has been submitted
                    String productName = request.getParameter("productName");
                    String collection = request.getParameter("collection");
                    String priceStr = request.getParameter("price");
                    String imageUrl = request.getParameter("imageUrl");
                    String description = request.getParameter("description");

                    if (productName != null && collection != null && priceStr != null && description != null) {
                        try {
                            double price = Double.parseDouble(priceStr);
                            boolean success = productDao.updateProduct(productId, productName, collection, price, imageUrl, description);

                            if (success) {
                                out.print("<script>");
                                out.print("alert('Product updated successfully.');");
                                out.print("window.location.href = 'viewProduct.jsp';");
                                out.print("</script>");
                            } else {
                                out.print("<script>");
                                out.print("alert('Product update failed.');");
                                out.print("window.location.href = 'viewProduct.jsp';");
                                out.print("</script>");
                            }
                        } catch (NumberFormatException e) {
                            out.println("<div class='alert alert-danger'>Invalid price format.</div>");
                        }
                    } else {
                        out.println("<div class='alert alert-danger'>All fields are required.</div>");
                    }
                }
            }
        %>
    </div>
</body>
</html>