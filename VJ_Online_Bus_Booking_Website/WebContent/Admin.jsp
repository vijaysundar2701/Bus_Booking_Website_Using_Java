<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<link rel="stylesheet" type="text/css" href="css/back.css">
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
<script>
function myFunction(){
var today = new Date().toISOString().split('T')[0];
document.getElementsByName("txtDate")[0].setAttribute('min', today);
}
</script>
<script type="text/javascript">
  function checkForm()
  {
	var cities=["Ariyalur","Chennai","Coimbatore","Cuddaloor","Dharmapuri","Dindgul","Erode","Kancipuram","Kanniya kumari","Karur","Krishnagiri","Madurai","Namakkal","Nagapattinam","Permbalur","Puthukootai","Ramanathapuram","Salem","Sivagankai","Trichy","Theni","Thiruvanamalai","Tripur","Thirunelvei","Thiruvarur","Thiruvallur","Thoothukudi","Vellore","Villipuram","Virudhunagar"];
    var f=document.getElementById("Depature").value;
    var t=document.getElementById("Destination").value;
	if(cities.includes(f)&&cities.includes(t)&&f!=t)
    	{
    		alert("Welcome");
    	}
    else if(cities.includes(f)&&cities.includes(t)&&f==t)
    {
    	alert("Source and Destination city cannot be same");
    }
    else
    {
    		alert("Invalid place ! Please select the place from below list");
    }
  }
</script>
</head>
<body>
<form method="post" action="Passengerdata">
<div><h2>Depature Place</h2>
<input list="cities" id="Depature" name="Depature" placeholder="Depature place" required>
<datalist id="cities">
<option value="Ariyalur">
<option value="Chennai">
<option value="Coimbatore">
<option value="Cuddaloor">
<option value="Dharmapuri">
<option value="Dindgul">
<option value="Erode">
<option value="Kancipuram">
<option value="Kanniya kumari">
<option value="Karur">
<option value="Krishnagiri">
<option value="Madurai">
<option value="Namakkal">
<option value="Nagapattinam">
<option value="Permbalur">
<option value="Puthukootai">
<option value="Ramanathapuram">
<option value="Salem">
<option value="Sivagankai">
<option value="Trichy">
<option value="Theni">
<option value="Thiruvanamalai">
<option value="Tripur">
<option value="Thirunelvei">
<option value="Thiruvarur">
<option value="Thiruvallur">
<option value="Thoothukudi">
<option value="Vellore">
<option value="Villipuram">
<option value="Virudhunagar">
</datalist><br>
</div>
<div><h2>Destination Place</h2>
<input list="cities" id="Destination" name="Destination" placeholder="Destination place" required>
<datalist id="cities">
<option value="Ariyalur">
<option value="Chennai">
<option value="Coimbatore">
<option value="Cuddaloor">
<option value="Dharmapuri">
<option value="Dindgul">
<option value="Erode">
<option value="Kancipuram">
<option value="Kanniya kumari">
<option value="Karur">
<option value="Krishnagiri">
<option value="Madurai">
<option value="Namakkal">
<option value="Nagapattinam">
<option value="Permbalur">
<option value="Puthukootai">
<option value="Ramanathapuram">
<option value="Salem">
<option value="Sivagankai">
<option value="Trichy">
<option value="Theni">
<option value="Thiruvanamalai">
<option value="Tripur">
<option value="Thirunelvei">
<option value="Thiruvarur">
<option value="Thiruvallur">
<option value="Thoothukudi">
<option value="Vellore">
<option value="Villipuram">
<option value="Virudhunagar">
</datalist><br>
</div>
<div><h2>Depature Date</h2>
<input type="date"  id="txtDate" onclick="myFunction()" min="2020-04-01" name="txtDate" required/>
</div>
<div><h2>Depature Time</h2>
<input type="time" name="Time" id="Time" required>
</div>
<div><h2>Category</h2>
<select name="Category" id="Category" required>
	<option value="">Select Your Category</option>
	<option value="Ac Semi Sleeper">AC Semi Sleeper</option>
	<option value="Non AC Semi Sleeper">Non AC Semi Sleeper</option>
</select>
</div>
<div><h2>Cost</h2>
<input type="text" name="Cost" id="Cost" placeholder="Enter the Cost">
</div>
<div>
<h3>
<input type="button" onclick="location.href='http://localhost:8080/VJ_TRAVELS/Administrator.html';" value="Back" />
<input type="submit" value="Get Passenger Details">
</h3>
</div>
</form>
</body>
</html>