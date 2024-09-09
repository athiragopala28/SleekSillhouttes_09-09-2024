<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CollectionDao" %>
<%@ page import="bean.Collection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Collection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
            String idParam = request.getParameter("id");
            String collectionName = request.getParameter("collectionName");

            CollectionDao collectionDao = new CollectionDao();

            if (idParam != null && !idParam.isEmpty() && collectionName != null && !collectionName.isEmpty()) {
                try {
                    int collectionId = Integer.parseInt(idParam);
                    Collection collection = new Collection();
                    collection.setId(collectionId);
                    collection.setCollectionName(collectionName);

                    boolean isUpdated = collectionDao.updateCollection(collection);

                    if (isUpdated) {
                        out.println("<div class='alert alert-success'>Collection updated successfully.</div>");
                        response.sendRedirect("viewcollections.jsp");
                    } else {
                        out.println("<div class='alert alert-danger'>Failed to update collection.</div>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<div class='alert alert-danger'>Invalid collection ID.</div>");
                }
            } else {
                out.println("<div class='alert alert-danger'>Collection ID or name is missing.</div>");
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
