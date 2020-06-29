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
  padding: 8px 16px;
  text-decoration: none;
  margin: 4px 25px;
  cursor: pointer;
}
</style>
<script>
function selectedseats() 
{
	var selected = new Array();
    var seat = document.getElementsByName("hi");
    // Loop and push the checked CheckBox value in Array.
    for (var i = 0; i < seat.length; i++) {
        if (seat[i].checked) {
            selected.push(seat[i].value);
        }
    }

    //Display the selected CheckBox values.
    if (selected.length > 0) {
        alert("Your selected seats numbers are: " + selected.join(","));
    }
    else{
    	alert("You didn't select anyone of seats! Can you please select atleast one seat");
    }
}
</script>
<body>
<form action="Availableseat">
<%@ page import="java.util.*" %>
<div class="border">
<table border="2">
<thead>
<tr>
	<th>Depature</th>
	<th>Destination</th>
	<th>Date</th>
	<th>Time</th>
	<th>Category</th>
	<th>Cost</th>
	<th>Book</th>
</tr>
</thead>
<tbody>
<% List list = (List)session.getAttribute("list");
	if(list != null){
		for(int i=0;i<list.size();i++){
			Map map = (Map)list.get(i);
%>
	<tr>
		<td><%=map.get("depature")%></td>
   		<td><%=map.get("destination")%></td>
 		<td><%=map.get("date") %></td>
 		<td><%=map.get("time") %></td>
 		<td><%=map.get("category") %></td>
 		<td><%=map.get("cost") %></td>
 		<td><a href="Availableseat?val=<%=map.get("depature")%>@<%=map.get("destination")%>@<%=map.get("date")%>@<%=map.get("time")%>@<%=map.get("category")%>@<%=map.get("cost")%>">Book</a></td>	
	</tr>
<%}} %>
</tbody>
</table>
<input type="button" onclick="location.href='http://localhost:8080/VJ_TRAVELS/Home.html';" value="Back" />
</div>
</form>
</body>
</html>
