<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/view.css">
</head>
<style>
input[type=button]{
  background-color: white;
  border:thin solid black;
  color: black;
  padding: 5px 5px;
  text-decoration: none;
  margin: 10px 5%;
  cursor: pointer;
}
input[type=submit]{
  background-color: white;
  border:thin solid black;
  color: black;
  padding: 5px 5px;
  text-decoration: none;
  margin: 15px 10px;
  cursor: pointer;
}
</style>
<body>
<form action="Seat.jsp">
<%@ page import="java.util.*" %>
<div class="border">
<table border="2">
<thead>
<tr>
	<th>Seat No</th>
	<th>Name</th>
	<th>Age</th>
	<th>Gender</th>
	<th>Pno</th>
	<th>Email</th>
</tr>
</thead>
<tbody>
<% List list = (List)session.getAttribute("list");
	if(list != null){
		for(int i=0;i<list.size();i++){
			Map map = (Map)list.get(i);
%>
	<tr>
		<td><%=map.get("SeatNo")%></td>
   		<td><%=map.get("Name")%></td>
 		<td><%=map.get("Age") %></td>
 		<td><%=map.get("Gender") %></td>
 		<td><%=map.get("Pno") %></td>
 		<td><%=map.get("Email") %></td>
	</tr>
<%}} %>
</tbody>
</table>
<h3>
<input type="button" onclick="location.href='http://localhost:8080/VJ_TRAVELS/Administrator.html';" value="Back" />
<input type="button" onclick="window.print()" value="Print">
</h3>
</div>
</form>
</body>
</html>
