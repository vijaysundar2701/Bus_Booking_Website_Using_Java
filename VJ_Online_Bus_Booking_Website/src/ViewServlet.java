import java.io.*;  
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
  
public class ViewServlet extends HttpServlet {  
  
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter(); 
List list = new ArrayList();
Map map = null;
String from="";
String to="";
String[] Depature = request.getParameterValues("From");
for(int i=0; i<Depature.length; i++)
{
from=from+Depature[i]+"";
}
String[] Destination = request.getParameterValues("To");
for(int i=0; i<Destination.length; i++)
{
to=to+Destination[i]+"";
}
String date=request.getParameter("txtDate");   
System.out.println("From:"+from+"To:"+to+"Date"+date);
HttpSession session=request.getSession();  
//session.setAttribute("Dep",from);  
//session.setAttribute("Des",to);
//session.setAttribute("Date",date);
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travels","root","root"); 
              
    
PreparedStatement ps=con.prepareStatement("select busno,depature,destination,date,time,category,cost from admini where depature=? and destination=? and date=?");
ps.setString(1,from);
ps.setString(2,to);
ps.setString(3,date); 
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
		ses.setAttribute("busno",rs.getInt("busno"));
		ses.setAttribute("Dep",rs.getString("depature"));
		ses.setAttribute("Des",rs.getString("destination"));
		ses.setAttribute("Date",rs.getString("date"));	
		ses.setAttribute("time",rs.getString("time"));
		ses.setAttribute("category",rs.getString("category"));
		ses.setAttribute("cost",rs.getString("cost"));
		map = new HashMap<>();
		map.put("busno",rs.getInt("busno"));
		map.put("depature", rs.getString("depature"));
		map.put("destination", rs.getString("destination"));
		map.put("date", rs.getString("date"));
		map.put("time", rs.getString("time"));
		map.put("category", rs.getString("category"));
		map.put("cost", rs.getString("cost"));
		list.add(map);   
}
System.out.println(list);
ses.setAttribute("list", list);
if(list.isEmpty())
{
response.sendRedirect("Warning.html");
}
else{
response.sendRedirect("view.jsp");
}
}
catch (Exception e2) {e2.printStackTrace();}            
finally{out.close();}  
}
}
