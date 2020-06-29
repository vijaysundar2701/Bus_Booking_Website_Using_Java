import java.io.*;  
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
  
public class Availableseat extends HttpServlet {  
  
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter(); 
List list = new ArrayList();
Map map = null; 
//session.setAttribute("Dep",from);  
//session.setAttribute("Des",to);
//session.setAttribute("Date",date);
String val[] = request.getParameter("val").split("@");
HttpSession session = request.getSession();
session.setAttribute("de",val[0]); 
session.setAttribute("ds",val[1]); 
session.setAttribute("da",val[2]); 
session.setAttribute("ti",val[3]); 
session.setAttribute("ca",val[4]); 
session.setAttribute("co",val[5]); 
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travels","root","root"); 
              
String from=val[0];
String to=val[1];
String date=val[2];
String time=val[3];
String category=val[4];
String cost=val[5];
PreparedStatement ps=con.prepareStatement("select seatno,gender from passengerdetails where depature=? and destination=? and date=? and time=? and category=? and cost=?");
ps.setString(1,from);
ps.setString(2,to);
ps.setString(3,date);
ps.setString(4,time);
ps.setString(5,category);
ps.setString(6,cost);
System.out.println("Query>>"+ps);
out.print("<table width=100% border=1>");  
out.print("<caption>Bus Details</caption>");  
  
ResultSet rs=ps.executeQuery();  
              
/* Printing column names */  
ResultSetMetaData rsmd=rs.getMetaData();  
HttpSession ses = request.getSession();
/* Printing result */  
while(rs.next())  
{
		ses.setAttribute("Selectedseat",rs.getString("seatno"));
		ses.setAttribute("Gender",rs.getString("gender"));
		map = new HashMap<>();
		map.put("Selectedseat", rs.getString("seatno"));
		map.put("Gender", rs.getString("gender"));
		list.add(map);   
}
System.out.println(list);
ses.setAttribute("list", list);
if(list.isEmpty())
{
response.sendRedirect("Selectedseat.jsp");
}
else{
response.sendRedirect("Selectedseat.jsp");
}
}
catch (Exception e2) {e2.printStackTrace();}            
finally{out.close();}  
}
}
