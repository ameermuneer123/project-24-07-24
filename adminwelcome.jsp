<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<%


%>


<%
// Database connection parameters
String dbUrl = "jdbc:mysql://localhost:3306/ministore";
String dbUser = "root";
String dbPassword = "";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

int userCount = 0;
int productCount = 0;
int orderCount = 0;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    stmt = conn.createStatement();

    // Query to get user count
    rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM ministore_user");
    if (rs.next()) {
        userCount = rs.getInt("count");
    }

   //  Query to get product count
     rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM products");
    if (rs.next()) {
        productCount = rs.getInt("count");
    }

    // Query to get order count
    rs = stmt.executeQuery("SELECT COUNT(*) AS count FROM orders");
    if (rs.next()) {
        orderCount = rs.getInt("count");
    } 

} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}

%>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ministore</title>
    <!-- Bootstrap CSS -->
     <style>
        .profile-image {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 100px;
            height: 100px;
        }
        .card-body-relative {
            position: relative;
                        min-height: 150px; /* Adjust this value as needed */
            
        }
    </style>
   </head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">

    <div class="container mt-5">
        <div class="row">
              <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-header">Registered Users</div>
                    <div class="card-body card-body-relative">
                        <img src="images/profile_pic.jpg" alt="User Profile Image" class="img-fluid rounded-circle mb-3 profile-image">
                        <h5 class="card-title"><%= userCount %></h5>
                    </div>
                </div>
          
        </div>
        
         <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-header">Available Product</div>
                    <div class="card-body card-body-relative">
                        <img src="images/product.jpg" alt="User Profile Image" class="img-fluid rounded-circle mb-3 profile-image">
                        <h5 class="card-title"><%= productCount %></h5>
                    </div>
                </div>
          
        </div>
         <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-header">Orders </div>
                    <div class="card-body card-body-relative">
                        <img src="images/orders.jpg" alt="User Profile Image" class="img-fluid rounded-circle mb-3 profile-image">
                        <h5 class="card-title"><%= 100 %></h5>
                    </div>
                </div>
          
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


