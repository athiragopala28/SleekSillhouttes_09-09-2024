<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MaterialDao" %>
<%@ page import="bean.MaterialBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Material</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<h2>Update Material</h2>

		<%
			// Retrieve the material ID from the request parameter
			String idParam = request.getParameter("id");

			if (idParam == null || idParam.isEmpty()) {
				out.println("<div class='alert alert-danger'>Material ID is missing.</div>");
			} else {
				int materialId = Integer.parseInt(idParam);
				MaterialDao materialDao = new MaterialDao();
				MaterialBean material = materialDao.getMaterialById(materialId);

				if (material == null) {
					out.println("<div class='alert alert-danger'>Material not found.</div>");
				} else {
					// Check if form has been submitted
					String materialName = request.getParameter("materialName");
					String materialType = request.getParameter("materialType");
					String description = request.getParameter("description");

					if (materialName != null && materialType != null && description != null &&
					    !materialName.trim().isEmpty() && !materialType.trim().isEmpty() && !description.trim().isEmpty()) {
						
						// Update MaterialBean with form data
						material.setName(materialName);
						material.setType(materialType);
						material.setDescription(description);

						try {
							boolean success = materialDao.updateMaterial(material);
							if (success) {
								out.print("<script>");
								out.print("alert('Material updated successfully.');");
								out.print("window.location.href = 'viewmaterial.jsp';");
								out.print("</script>");
							} else {
								out.print("<script>");
								out.print("alert('Material update failed.');");
								out.print("window.location.href = 'viewmaterial.jsp';");
								out.print("</script>");
							}
						} catch (Exception e) {
							out.println("<div class='alert alert-danger'>Error updating material: " + e.getMessage() + "</div>");
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
