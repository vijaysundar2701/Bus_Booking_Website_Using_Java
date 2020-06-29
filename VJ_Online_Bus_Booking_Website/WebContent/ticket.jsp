<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/pay.css">
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
<form action="Mailsend.jsp">
<div class="border">
<img src="images/vjlogo.jpg">
<h2>Thanks for using VJ travels</h2>
<h3>Happy Journey !</h3>
<% 
String dep=(String)session.getAttribute("de");
String des=(String)session.getAttribute("ds");
String date=(String)session.getAttribute("da"); 
String time=(String)session.getAttribute("ti");
String category=(String)session.getAttribute("ca"); 
String[] Name = (String[])session.getAttribute("name");
String[] Age = (String[])session.getAttribute("age");
String[] Gender = (String[])session.getAttribute("gender");
String Pno=(String)session.getAttribute("pno");
String Email=(String)session.getAttribute("mail");
String cost=(String)session.getAttribute("co"); 
String[] seat = (String[])session.getAttribute("a");
int n=seat.length;
System.out.println(n);
System.out.println(cost);
int c=Integer.valueOf(cost);
int total=n*c;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/travels", "root", "root" );
Statement sd=conn1.createStatement();
for(int i=0;i<seat.length;i++)
{
sd.executeUpdate("insert into passengerdetails(depature,destination,date,time,category,cost,name,age,gender,pno,email,seatno) values('"+dep+"','"+des+"','"+date+"','"+time+"','"+category+"','"+cost+"','"+Name[i]+"','"+Age[i]+"','"+Gender[i]+"','"+Pno+"','"+Email+"','"+seat[i]+"')");
}
%>
<fieldset>
<table>
<tr>
<th>From</th>
<td><%out.println(dep);%></td>
<th>To</th>
<td><%out.print(des);%></td>
</tr>
<tr>
<th>Date</th>
<td><%out.print(date);%></td>
<th>Time</th>
<td><%out.print(time);%></td>
</tr>
<tr>
<th>Category</th>
<td><% out.print(category);%></td>
<th>Total No.of.Passengers</th>
<td><% out.print(n);%></td>
</tr>
</table>
</fieldset>
<fieldset>
<table>
<tr>
<th>  Seat Number  </th>
<th>  Passenger Name  </th>
<th>  Age  </th>
<th>  Gender  </th>
</tr>
<%for(int i=0; i<seat.length; i++){%>
<tr>
	<td><%out.println(seat[i]);%></td>
	<td><%out.print(Name[i]);%></td>
	<td><% out.print(Age[i]);%></td>
	<td><% out.print(Gender[i]);%></td>
</tr>
<%}%>
</table>
</fieldset>
<fieldset>
<table>
<tr>
<th>Email</th>
<td><% out.print(Email);%></td>
</tr>
<tr>
<th>Phone Number</th>
<td><% out.print(Pno);%></td>
<th>Total Cost</th>
<td><%out.print(total);%></td>
</tr>
</table>
</fieldset>
<input type="button" onclick="window.print()" value="Print">
<input type="submit"  value="Send">
</div>
</form>
</body>
</html>