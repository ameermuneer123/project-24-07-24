<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	boolean isValidUser = false;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ministore", "root", "");
		// Check if the user is admin
// Check if the user is admin
		if (email.equals("admin@gmail.com") && password.equals("Admin12@")) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("user", email);
			response.sendRedirect("adminwelcome.jsp");
		} else {
		String sql = "select password from ministore_user WHERE email=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if (rs.next()) {
				String storedHashedpassword = rs.getString("password");
				if (BCrypt.checkpw(password, storedHashedpassword)) {
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("user", email);
					response.sendRedirect("userwelcome.jsp");
				} else {
					response.sendRedirect("login.jsp?error=1");
				}
			} else {
				%>
				<script type="text/javascript">
					alert("No account? Create one");
					window.location.href = "register.jsp";
				</script>
				<%
			}
		}

	} catch (Exception e) {
		out.print("error");
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			out.print("error");
		}
	}
%>