<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	HttpSession httpsession = request.getSession(false);
	if (session != null) {
		String userEmail = (String) session.getAttribute("email");
		String userRole = (String) session.getAttribute("role");

		if (userEmail != null && userRole != null) {
			// Set the content type of the response
			/*  response.setContentType("text/html");
			
			 // Write the response content
			 response.getWriter().println("<html><body>");
			 response.getWriter().println("<h1>Welcome to the Dashboard</h1>");
			 response.getWriter().println("<p>Email: " + userEmail + "</p>");
			 response.getWriter().println("<p>Role: " + userRole + "</p>");
			 response.getWriter().println("</body></html>"); */
		} else {
			// Redirect to login page if user is not logged in
			response.sendRedirect("login.jsp");
		}
	} else {
		// Redirect to login page if session is null
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Material</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Add New Material</h2>

        <form action="addmaterial_action.jsp" method="POST">
            <div class="mb-3">
                <label for="materialName" class="form-label">Material Name</label>
                <input type="text" class="form-control" id="materialName" name="materialName" required>
            </div>
            <div class="mb-3">
                <label for="materialType" class="form-label">Material Type</label>
                <select class="form-select" id="materialType" name="materialType" required>
                    <option value="">Select Material Type</option>
                    <option value="Linen">Linen</option>
                    <option value="Silk">Silk</option>
                    <option value="Chiffon">Chiffon</option>
                    <option value="Crepe">Crepe</option>
                    <option value="Satin">Satin</option>
                    <option value="Nylon">Nylon</option>
                    <option value="Georgette">Georgette</option>
                    <option value="Velvet">Velvet</option>
                    <option value="Rayon">Rayon</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Material</button>
            <a href="viewmaterial.jsp" class="btn btn-secondary">Back to View Materials</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
