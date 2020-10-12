<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<body>
<%
try{
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
	
String host="", user="", pass="";

host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="*************"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="*************"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =Email;// out going email id

String from ="***************"; //Email id of the recipient
//String subject ="welcome";
String subject1="Welcome to VJ travels ! Get Your Ticket";
String msg1="!......Happy Journey......!\n";
msg1+="<fieldset><table><tr><th>From</th><td>"+dep+"</td><th>To</th><td>"+des+"</td></tr><tr><th>Date</th><td>"+date+"</td><th>Time</th><td>"+time+"</td></tr><tr><th>Category</th><td>"+category+"</td><th>No.of.Passenger</th><td>"+n+"</td></tr></table></fieldset>";
for(int i=0;i<seat.length;i++)
{
msg1+="<fieldset><table><tr><th>Seat No</th><td>"+seat[i]+"</td><th>Name</th><td>"+Name[i]+"</td></tr><tr><th>Age</th><td>"+Age[i]+"</td><th>Gender</th><td>"+Gender[i]+"</td></tr></table></fieldset>";
}
msg1+="<fieldset><table><tr><th>Phone No</th><td>"+Pno+"</td><th>Total Cost</th><td>"+total+"</td></tr></table></fieldset>";

/*<%msg1+="<fieldset><table><tr><th>Seat No</th><th>Name</th><th>Age</th><th>Gender</th></tr></table></fieldset>";
for(int i=0;i<seat.length;i++){
	msg1+="<fieldset><table><tr><td>"+seat[i]+"</td><td>"+Name[i]+"</td><td>"+Age[i]+"</td><td>"+Gender[i]+"</td></tr></table><fieldset>";
}
msg1+="<fieldset><tr><th>Phone no</th><td>"+Pno+"</td><th>Total Cost</th><td>"+total+"</td></tr> </fieldset>";*/%>
<%
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject1);
msg.setContent(msg1, "text/html");// use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());%>

<%}
catch (Exception err) {

out.println("message not successfully sended"); // assume itâs a fail
}
transport.close();
%>
<script>
alert("Request Update Successfully");
</script>
<%

}
catch (Exception ex) 
{
	out.println(ex.getMessage());
}
%>
</body>
</html>
