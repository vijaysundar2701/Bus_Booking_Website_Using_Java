import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*;

import com.mysql.jdbc.ResultSet;

import javax.servlet.*;


public class Admin extends HttpServlet{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, 
   HttpServletResponse response)
 throws ServletException, IOException {
  int a=0;
  String dep="";
  String des="";
  String cat="";
  response.setContentType("text/html");
  PrintWriter pw = response.getWriter();
  String[] Depature = request.getParameterValues("Depature");
  for(int i=0; i<Depature.length; i++){
  dep=dep+Depature[i]+"";
  }
  String[] Destination = request.getParameterValues("Destination");
  for(int i=0; i<Destination.length; i++){
  des=des+Destination[i]+"";
  }
  String dob=request.getParameter("txtDate");  
  String time=request.getParameter("Time");  
  String[] Category = request.getParameterValues("Category");
  for(int i=0; i<Category.length; i++){
  cat=cat+Category[i]+" ";
  }
  String cost=request.getParameter("Cost"); 

  
try
{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travels", "root", "root" );
        Statement st=conn.createStatement();
        ResultSet rs = (ResultSet) st.executeQuery("select  max(busno) as busno from admini");

		if(rs.next())  {
			 a=rs.getInt("busno");	
			 System.out.println(a);
		}
		int uniq = a+1;
		System.out.println(uniq);
		Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/travels", "root", "root" );
        Statement sd=conn1.createStatement();
        sd.executeUpdate("insert into admini(busno,depature,destination,date,time,category,cost) values('"+uniq+"','"+dep+"','"+des+"','"+dob+"','"+time+"','"+cat+"','"+cost+"')");
        System.out.println("Inserted Successfully!"+uniq+" "+dep+" "+des+" "+dob+" "+time+" "+cat+" "+cost);
        pw.println("Inserted Successfully!"+uniq+" "+dep+" "+des+" "+dob+" "+time+" "+cat+" "+cost);
}
catch(Exception e){}
  }
}