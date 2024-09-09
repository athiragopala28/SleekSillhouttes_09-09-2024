<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MaterialDao"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import ="java.sql.SQLException" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Material</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<%
			MaterialDao materialDao = new MaterialDao();
			String idParam = request.getParameter("id");

			if (idParam != null && !idParam.isEmpty()) {
				try {
					int materialId = Integer.parseInt(idParam);
					boolean success = materialDao.deleteMaterial(materialId);

					if (success) {
						out.print("<script>");
						out.print("alert('Material deleted successfully.');");
						out.print("window.location.href = 'viewmaterial.jsp';");
						out.print("</script>");
					} else {
						out.print("<script>");
						out.print("alert('Failed to delete material.');");
						out.print("window.location.href = 'viewmaterial.jsp';");
						out.print("</script>");
					}
				} catch (NumberFormatException e) {
					out.println("<div class='alert alert-danger'>Invalid material ID.</div>");
				} catch (SQLException e) {
					out.println("<div class='alert alert-danger'>Database error: " + e.getMessage() + "</div>");
				}
			} else {
				out.println("<div class='alert alert-danger'>Material ID is missing.</div>");
			}
		%>

	</div>
</body>
</html>
