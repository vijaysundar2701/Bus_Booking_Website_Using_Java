<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/book.css">
</head>
<style>
input[type=button]{
  background-color: white;
  border:thin solid black;
  color: black;
  padding: 5px 7px;
  text-decoration: none;
  margin: 10px 25%;
  cursor: pointer;
}
input[type=submit]{
  background-color: white;
  border:thin solid black;
  color: black;
  padding: 5px 7px;
  text-decoration: none;
  margin: 15px 10px;
  cursor: pointer;
}
</style>
<body>
<%@ page import="java.util.*" %>
<form action="checking.jsp">
<div class="border">
<%
String[] checkedseats = request.getParameterValues("seat");
if(checkedseats==null)
{
response.sendRedirect("Emptyseat.html");
}
else
{
session.setAttribute("a", checkedseats);
for(int i=0;i<checkedseats.length;i++){%>
	<fieldset>
	<p id="seat" name="seat">Seat Number : <% out.print(checkedseats[i]);%></p>
	Name <input type="text" name="name"  id="name" required>
	Age <input type="number" name="age" id="age" maxlength="3" min="0" max="100" size="3" required>
	Gender <select name="gender" id="gender" required>
	<option value="Male">Male</option>
	<option value="Female">Female</option>
	</select>
	</fieldset>
<%}}%>
	<fieldset>
	Phone Number <input type="text" name="pno" id="pno" maxlength="10" size="10" required>
	Email Id <input type="email" name="mail" id="mail" size="30" required></br>
	</fieldset>
	<div id="buttons" class="buttons">
	<input type="button" onclick="location.href='http://localhost:8080/VJ_TRAVELS/Selectedseat.jsp';" value="Back" />
	<input type="submit" value="Book">
	</div>
</div>
</form>
</body>
</html>