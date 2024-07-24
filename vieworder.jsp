<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%

HttpSession httpSession = request.getSession();
if(httpSession==null || httpSession.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
	
	
}


String user=(String)httpSession.getAttribute("user");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Ministore</title>
</head>
<body>

</body>
</html>