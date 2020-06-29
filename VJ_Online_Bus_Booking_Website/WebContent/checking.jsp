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
  padding: 8px 16px;
  text-decoration: none;
  margin: 4px 20%;
  cursor: pointer;
}
input[type=submit]{
  background-color: white;
  border:thin solid black;
  color: black;
  padding: 8px 16px;
  text-decoration: none;
  margin: 15px 35%;
  cursor: pointer;
}
</style>
<body>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="com.mysql.jdbc.ResultSet"%>
<%@ page import="javax.servlet.*"%>

<form action="Payment.jsp">
<div class="border">
<% 
response.setContentType("text/html");
PrintWriter pw = response.getWriter();
String[] seat = (String[]) session.getAttribute("a");
String[] Name = request.getParameterValues("name");
String[] Age = request.getParameterValues("age");
String[] Gender = request.getParameterValues("gender");
session.setAttribute("name", Name);
session.setAttribute("age", Age);
session.setAttribute("gender", Gender);
String Pno=request.getParameter("pno");
String Email=request.getParameter("mail"); 
session.setAttribute("pno",Pno);
session.setAttribute("mail",Email);
String dep=(String)session.getAttribute("de");
String des=(String)session.getAttribute("ds");
String date=(String)session.getAttribute("da"); 
String time=(String)session.getAttribute("ti");
String category=(String)session.getAttribute("ca");
String cost=(String)session.getAttribute("co"); 
%>
	<fieldset>
	<p>Depature : <% out.print(dep);%></p>
	<p>Destination : <% out.print(des);%></p>
	<p>Date : <% out.print(date);%></p>
	<p>Time : <% out.print(time);%></p>
	<p>Category : <% out.print(category);%></p>
	<p>Cost : <% out.print(cost);%></p>
	</fieldset>
	<%for(int i=0; i<seat.length; i++){%>
	<fieldset>
	<p>Seat : <%out.println(seat[i]);%></p>
	<p>Name : <%out.print(Name[i]);%></p>
	<p>Age : <% out.print(Age[i]);%></p>
	<p>Gender : <% out.print(Gender[i]);%></p>
	</fieldset>
	<%}%>
	<fieldset>
	<p>Phone number : <% out.print(Pno);%></p>
	<p>Email : <% out.print(Email);%></p>
	</fieldset>
	<input type="submit" value="Make Payment">
	
</div>
</form>
</body>
</html>