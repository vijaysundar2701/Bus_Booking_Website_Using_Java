<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/pay.css">
</head>
<script type="text/javascript">
			function showHideDiv(ele) {
				var srcElement = document.getElementById(ele);
				if (srcElement != null) {
					if (srcElement.style.display == "block") {
						srcElement.style.display = 'none';
					}
					else {
						srcElement.style.display = 'block';
					}
					return false;
				}
			}
		</script>
<style>
.content {
  display: none;
}
input:checked + span,
input:checked + input {
  display: block;
}
#con {
  display: none;
  
}
input[type="button"]{
    color: transparent;
    text-shadow: 0 0 0 #000;
    padding: 2px 2px;
    width: 50px;
    cursor: pointer;
    background-color: white;
  	border:thin solid black;
  	color: black;
 	text-decoration: none;
  	cursor: pointer;
}
input[type="button"]:focus{
    outline: none;
    
}
input:focus + div#con {
  display: block;
}
</style>

<script>
$('.trigger').change(function () {
    $('.content').hide();
    $('.' + $('.trigger:checked').data('rel')).show();
}).change(); //Show content on page load
</script>
<%@ page import="java.util.*" %>
<%
String[] seat = (String[]) session.getAttribute("a");
String cost=(String)session.getAttribute("co"); 
int n=seat.length;
System.out.println(n);
System.out.println(cost);
int c=Integer.valueOf(cost);
int total=n*c;
%>
<body>
<div class="border">
<h1>Payment Options</h1>
<form action="ticket.jsp">
<div>
<label>
<input type="radio" name="group1" class="trigger" data-rel="abc"/ required>Debit Card
<span class="content" id="deb">
	<span>
	Debit Card Number<input type="text" name="de" id="de" required><br>
	Expiry Month<select name="month" id="month" required>
		<option value="01">Jan (01)</option> 
		<option value="02">Feb (02)</option> 
		<option value="03">Mar (03)</option> 
		<option value="04">Apr (04)</option> 
		<option value="05">May (05)</option> 
		<option value="06">Jun (06)</option> 
		<option value="07">Jul (07)</option> 
		<option value="08">Aug (08)</option> 
		<option value="09">Sep (09)</option> 
		<option value="10">Oct (10)</option> 
		<option value="11">Nov (11)</option> 
		<option value="12">Dec (12)</option> 
	</select>
	Expiry Year<select name="year" id="year" required>
		<option value="2020">2020</option> <option value="2021">2021</option> <option value="2022">2022</option> <option value="2023">2023</option> <option value="2024">2024</option> <option value="2025">2025</option> <option value="2026">2026</option> <option value="2027">2027</option> <option value="2028">2028</option> <option value="2029">2029</option> <option value="2030">2030</option> <option value="2031">2031</option> <option value="2032">2032</option> <option value="2033">2033</option> <option value="2034">2034</option> <option value="2035">2035</option> <option value="2036">2036</option> <option value="2037">2037</option> <option value="2038">2038</option> <option value="2039">2039</option> <option value="2040">2040</option> 	
	</select>
	CVV<input type="text" name="cvv" id="cvv" required><br>
	Cardholder's Name<input type="text" name="cname" id="cname" required><br>
	Phone Number <input type="text" name="pno" id="pno" maxlength="10" size="10" required>
	<input type="button" value="Next" onClick="showHideDiv('divMsg')"/>
	<div id="divMsg" style=" display:none">
		Enter the OTP<input type="text" name="OTP" id="OTP" maxlength="6" size="6" required>
		<a href="ticket.jsp" style="background-color: white;border:thin solid black; color: black; padding: 2px 4px;text-decoration: none;cursor: pointer;">PAY INR <%=total %></a>
	</div>
	</span>
</span>
</label>
</div>

<div>
<label>
<input type="radio" name="group1" class="trigger" data-rel="xyz" />Credit Card
<span class="content" id="deb">
	<span>
	Credit Card Number<input type="text" name="cr" id="cr" required><br>
	Expiry Month<select name="month" id="month" required>
		<option value="01">Jan (01)</option> 
		<option value="02">Feb (02)</option> 
		<option value="03">Mar (03)</option> 
		<option value="04">Apr (04)</option> 
		<option value="05">May (05)</option> 
		<option value="06">Jun (06)</option> 
		<option value="07">Jul (07)</option> 
		<option value="08">Aug (08)</option> 
		<option value="09">Sep (09)</option> 
		<option value="10">Oct (10)</option> 
		<option value="11">Nov (11)</option> 
		<option value="12">Dec (12)</option> 
	</select>
	Expiry Year<select name="year" id="year" required>
		<option value="2020">2020</option> <option value="2021">2021</option> <option value="2022">2022</option> <option value="2023">2023</option> <option value="2024">2024</option> <option value="2025">2025</option> <option value="2026">2026</option> <option value="2027">2027</option> <option value="2028">2028</option> <option value="2029">2029</option> <option value="2030">2030</option> <option value="2031">2031</option> <option value="2032">2032</option> <option value="2033">2033</option> <option value="2034">2034</option> <option value="2035">2035</option> <option value="2036">2036</option> <option value="2037">2037</option> <option value="2038">2038</option> <option value="2039">2039</option> <option value="2040">2040</option> 	
	</select>
	CVV<input type="text" name="cvv" id="cvv" required><br>
	Cardholder's Name<input type="text" name="cname" id="cname" required><br>
	Phone Number <input type="text" name="pno" id="pno" maxlength="10" size="10" required>
	<input type="button" value="Next" onClick="showHideDiv('div')"/>
	<div id="div" style=" display:none">
		Enter the OTP<input type="text" name="OTP" id="OTP" maxlength="6" size="6" required>
		<a href="ticket.jsp" style="background-color: white;border:thin solid black; color: black; padding: 2px 4px;text-decoration: none;cursor: pointer;">PAY INR <%=total %></a>
	</div>
	</span>
</span>
</label>
</div>

<div>
<label>
<input type="radio" name="group1" class="trigger" data-rel="def" />Google Pay
<span class="content" id="deb">
	<span>
		Enter Phone Number Registered With GPayPhone Number <input type="text" name="pno" id="pno" maxlength="10" size="10" required>
		<input type="button" value="Next" onClick="showHideDiv('divM')"/><br>
		<div id="divM" style=" display:none">
			Enter the OTP<input type="text" name="OTP" id="OTP" maxlength="6" size="6" required>
			<a href="ticket.jsp" style="background-color: white;border:thin solid black; color: black; padding: 2px 4px;text-decoration: none;cursor: pointer;">PAY INR <%=total %></a>
		</div>
	</span>
</span>
</label>
</div>

<div>
<label>
<input type="radio" name="group1" class="trigger" data-rel="ghi" />Net Banking
<span class="content" id="net">
	<span>
		<a href="https://www.onlinesbi.com/">SBI</a><br>
		<a href="https://www.icicibank.com/nri-banking/new-customers-quick.page">ICICI</a><br>
		<a href="https://www.axisbank.com/bank-smart/internet-banking/features-services">AXIS BANK</a><br>
		<a href="https://www.indianbank.net.in/jsp/startIBPreview.jsp">INDIAN BANK</a>
	</span>
</span>
</label>
</div>
<h1>Total No.of.Seats=<%=n%></h1>
<h1>Total Amount=<%=total%></h1>
</form>
</div>
</body>
</html>