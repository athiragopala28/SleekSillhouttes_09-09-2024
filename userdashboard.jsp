<%@page import="bean.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
.navbar-brand {
	flex-grow: 1;
	font-size: 1.5rem;
	text-align: left;
}

.navbar-nav .nav-item {
	margin-right: 10px;
}

.icon-color {
	color: #000000;
}

.btn-black {
	color: #000000;
	border-color: #000000;
	background-color: #ffffff;
}

.btn-black:hover {
	color: #000000;
	background-color: #f0f0f0;
	border-color: #000000;
}

.btn-search {
	color: #000000;
	border-color: #000000;
	background-color: #ffffff;
}

.btn-search:hover {
	color: #000000;
	background-color: #f0f0f0;
	border-color: #000000;
}

.form-control {
	border-color: #4caf50;
}

footer {
	background-color: #f8f9fa;
	padding: 40px 0;
	color: #6c757d;
	border-top: 1px solid #dee2e6;
}

.footer-content {
	display: flex;
	justify-content: space-between;
	gap: 20px;
	flex-wrap: wrap;
}

.footer-section {
	flex: 1;
	min-width: 200px;
}

.footer-section h5 {
	font-weight: bold;
	margin-bottom: 15px;
}

.footer-section ul {
	list-style: none;
	padding: 0;
}

.footer-section ul li {
	margin-bottom: 10px;
}

.footer-section a {
	color: #6c757d;
	text-decoration: none;
}

.footer-section a:hover {
	text-decoration: underline;
}

.social-icons a {
	color: #000000;
	font-size: 20px;
	margin-right: 10px;
}

.social-icons a:hover {
	color: #007bff; /* Change color on hover */
}
</style>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Sleek Silhouettes</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <%
                    CollectionDao collectionDAO = new CollectionDao();
                    List<Collection> collections = null;
                    try {
                        collections = collectionDAO.getAllCollections(); // Method to get all collections
                    } catch (SQLException e) {
                        e.printStackTrace();
                        // Handle the error
                    }
                %>

                <li class="nav-item dropdown">
                    <button class="btn btn-outline-black btn-black dropdown-toggle" type="button" id="collectionsDropdown" data-bs-toggle="dropdown" aria-expanded="false">Collections</button>
                    <ul class="dropdown-menu" aria-labelledby="collectionsDropdown">
                        <li><a class="dropdown-item" href="#">Kurthi</a></li>
                        <li><a class="dropdown-item" href="#">Salwar</a></li>
                        <li><a class="dropdown-item" href="#">Saree</a></li>
                        <%
                            if (collections != null && !collections.isEmpty()) {
                        %>
                        <%
                            for (Collection collection : collections) {
                        %>
                        <li><a class="dropdown-item" href="#"><%=collection.getCollectionName()%></a></li>
                        <%
                            }
                        %>
                        <%
                            } else {
                       
                            }
                        %>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <button class="btn btn-outline-black btn-black dropdown-toggle" type="button" id="materialsDropdown" data-bs-toggle="dropdown" aria-expanded="false">Materials</button>
                    <ul class="dropdown-menu" aria-labelledby="materialsDropdown">
                        <li><a class="dropdown-item" href="#">Linen</a></li>
                        <li><a class="dropdown-item" href="#">Silk</a></li>
                        <li><a class="dropdown-item" href="#">Chiffon</a></li>
                        <li><a class="dropdown-item" href="#">Crepe</a></li>
                        <li><a class="dropdown-item" href="#">Satin</a></li>
                        <li><a class="dropdown-item" href="#">Nylon</a></li>
                        <li><a class="dropdown-item" href="#">Georgette</a></li>
                        <li><a class="dropdown-item" href="#">Velvet</a></li>
                        <li><a class="dropdown-item" href="#">Rayon</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <button class="btn btn-outline-black btn-black dropdown-toggle" type="button" id="customerCareDropdown" data-bs-toggle="dropdown" aria-expanded="false">Customer Care</button>
                    <ul class="dropdown-menu" aria-labelledby="customerCareDropdown">
                        <li><a class="dropdown-item" href="#">Contact Us</a></li>
                        <li><a class="dropdown-item" href="#">FAQ</a></li>
                        <li><a class="dropdown-item" href="#">Return Policy</a></li>
                        <li><a class="dropdown-item" href="#">Shipping Information</a></li>
                        <li><a class="dropdown-item" href="feedback.jsp">Feedback</a></li>
                    </ul>
                </li>
            </ul>				<form class="d-flex me-3" role="search">
					<input class="form-control me-2" type="search"
						placeholder="Sleek Silhouettes" aria-label="Sleek Silhouettes">
					<button class="btn btn-search" type="submit">Search</button>
				</form>
				<div class="d-flex align-items-center gap-3">
    <a href="viewfavorites.jsp" class="btn btn-outline-black icon-color">
        <i class="fas fa-heart"></i> 
    </a>
    <a href="viewcart.jsp" class="btn btn-outline-black icon-color">
        <i class="fas fa-shopping-cart"></i> 
    </a>
    <a href="profile.jsp" class="btn btn-outline-black icon-color">
        <i class="fas fa-user"></i> Profile
    </a>
    <a href="logout.jsp">
        <button type="button" class="btn btn-black">LogOut</button>
    </a>
</div>

	</nav>

	<!-- Product Card Start -->
	<div class="container mt-4">
		<div class="row">
			<!-- First Product Card -->
			<div class="col-md-4">
				<div class="card card-custom">
					<img src="./images/full-shot-girl-posing-pink-dress.jpg" class="card-img-top"
						alt="Product Image">
					<div class="card-body">
						<h5 class="card-title">Product 1</h5>
						<p class="card-text">$29.99</p>
						<div class="d-flex justify-content-center">
							<a href="#" class="btn btn-outline-danger btn-custom"> <i
								class="fas fa-heart"></i>
							</a> <a href="#" class="btn btn-outline-primary btn-custom"> <i
								class="fas fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Second Product Card -->
			<div class="col-md-4">
				<div class="card card-custom">
					<img src="./images/model-wearing-beautiful-shade-clothing.jpg" class="card-img-top"
						alt="Product Image">
					<div class="card-body">
						<h5 class="card-title">Product 2</h5>
						<p class="card-text">$39.99</p>
						<div class="d-flex justify-content-center">
							<a href="#" class="btn btn-outline-danger btn-custom"> <i
								class="fas fa-heart"></i>
							</a> <a href="#" class="btn btn-outline-primary btn-custom"> <i
								class="fas fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Third Product Card -->
			<div class="col-md-4">
				<div class="card card-custom">
					<img src="./images/young-indian-woman-wearing-sari.jpg" class="card-img-top"
						alt="Product Image">
					<div class="card-body">
						<h5 class="card-title">Product 3</h5>
						<p class="card-text">$49.99</p>
						<div class="d-flex justify-content-center">
							<a href="#" class="btn btn-outline-danger btn-custom"> <i
								class="fas fa-heart"></i>
							</a> <a href="#" class="btn btn-outline-primary btn-custom"> <i
								class="fas fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="container mt-4">
		<div class="row">
			<!-- First Product Card -->
			<div class="col-md-4">
				<div class="card card-custom">
					<img src="./images/fashion-portrait-young-elegant-woman.jpg" class="card-img-top"
						alt="Product Image">
					<div class="card-body">
						<h5 class="card-title">Product 1</h5>
						<p class="card-text">$29.99</p>
						<div class="d-flex justify-content-center">
							<a href="#" class="btn btn-outline-danger btn-custom"> <i
								class="fas fa-heart"></i>
							</a> <a href="#" class="btn btn-outline-primary btn-custom"> <i
								class="fas fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Second Product Card -->
			<div class="col-md-4">
				<div class="card card-custom">
					<img src="./images/young-woman-beautiful-yellow-dress.jpg" class="card-img-top"
						alt="Product Image">
					<div class="card-body">
						<h5 class="card-title">Product 2</h5>
						<p class="card-text">$39.99</p>
						<div class="d-flex justify-content-center">
							<a href="#" class="btn btn-outline-danger btn-custom"> <i
								class="fas fa-heart"></i>
							</a> <a href="#" class="btn btn-outline-primary btn-custom"> <i
								class="fas fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Third Product Card -->
			<div class="col-md-4">
				<div class="card card-custom">
					<img src="./images/sideways-woman-posing-green-house.jpg" class="card-img-top"
						alt="Product Image">
					<div class="card-body">
						<h5 class="card-title">Product 3</h5>
						<p class="card-text">$49.99</p>
						<div class="d-flex justify-content-center">
							<a href="#" class="btn btn-outline-danger btn-custom"> <i
								class="fas fa-heart"></i>
							</a> <a href="#" class="btn btn-outline-primary btn-custom"> <i
								class="fas fa-shopping-cart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Product Card End -->



	<style>
.navbar-brand {
	flex-grow: 1;
	font-size: 1.5rem;
	text-align: left;
}

.navbar-nav .nav-item {
	margin-right: 10px;
}

.icon-color {
	color: #000000;
}

.btn-black {
	color: #000000;
	border-color: #000000;
	background-color: #ffffff;
}

.btn-black:hover {
	color: #000000;
	background-color: #f0f0f0;
	border-color: #000000;
}

.btn-search {
	color: #000000;
	border-color: #000000;
	background-color: #ffffff;
}

.btn-search:hover {
	color: #000000;
	background-color: #f0f0f0;
	border-color: #000000;
}

.form-control {
	border-color: #4caf50;
}

footer {
	background-color: #001f3f; /* Navy blue */
	padding: 40px 0;
	color: #ffffff; /* White text color for contrast */
	border-top: 1px solid #dee2e6;
}

.footer-content {
	display: flex;
	justify-content: space-between;
	gap: 20px;
	flex-wrap: wrap;
}

.footer-section {
	flex: 1;
	min-width: 200px;
}

.footer-section h5 {
	font-weight: bold;
	margin-bottom: 15px;
}

.footer-section ul {
	list-style: none;
	padding: 0;
}

.footer-section ul li {
	margin-bottom: 10px;
}

.footer-section a {
	color: #ffffff; /* White link color */
	text-decoration: none;
}

.footer-section a:hover {
	text-decoration: underline;
}

.social-icons a {
	color: #ffffff; /* White icon color */
	font-size: 20px;
	margin-right: 10px;
}

.social-icons a:hover {
	color: #adb5bd; /* Light gray on hover */
}
</style>

	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
