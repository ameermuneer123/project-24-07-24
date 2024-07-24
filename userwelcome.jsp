<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
HttpSession httpSession = request.getSession();
if (httpSession == null || httpSession.getAttribute("user") == null) {
	response.sendRedirect("login.jsp");
	return;
}

String user = (String) httpSession.getAttribute("user");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Ministore</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<style>
.product-card {
	transition: transform 0.2s, box-shadow 0.2s;
}

.product-card:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.profile-icon {
	display: inline-block;
	font-size: 1.5em;
}

.card-img-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 200px;
	overflow: hidden;
}

.card-img-container img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Ministore</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="#">My
							Orders</a>
							<li class="nav-item "><a
						class="nav-link" href="viewCart.jsp" > Cart </a>



						
						</li>
							</li>
				</ul>
				<ul class="navbar-nav ms-auto">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="profile-icon">
                <i class="fas fa-user-circle"></i>
            </div>
        </a>
        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
            <span class="dropdown-item-text"><b><%=user%></b></span>
            <a class="dropdown-item" href="#">Edit Profile</a>
            <a class="dropdown-item" href="logout.jsp">Logout</a>
        </div>
    </li>
</ul>

			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<%
			String url = "jdbc:mysql://localhost:3306/ministore";
			String username = "root";
			String password = "";
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);
				stmt = conn.createStatement();
				String sql = "SELECT id, name, price, size, colour, storage, ram, image_url FROM products";
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					double price = rs.getDouble("price");
					String size = rs.getString("size");
					String colour = rs.getString("colour");
					String storage = rs.getString("storage");
					String ram = rs.getString("ram");

					String image = rs.getString("image_url");
			%>
			<div class="col-md-4">
				<div class="card mb-4 shadow-sm bg-light product-card">

					<div class="card-img-container">
						<a href="productdetails.jsp?id=<%=id%>"> <img
							alt="<%=name%>" src="<%=image%>">
						</a>

					</div>
					<div class="card-body">
						<h5 class="card-title"><%=name%></h5>
						<p class="card-text">
							<strong>Price:</strong>
							<%=price%><br> <strong>Size:</strong>
							<%=size%><br>
						</p>

						
					</div>
				</div>
			</div>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			if (rs != null)
			try {
				rs.close();
			} catch (SQLException ignore) {
			}
			if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException ignore) {
			}
			if (conn != null)
			try {
				conn.close();
			} catch (SQLException ignore) {
			}
			}
			%>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>
