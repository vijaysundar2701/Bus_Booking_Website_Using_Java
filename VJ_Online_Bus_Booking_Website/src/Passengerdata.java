

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Passengerdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 
		List list = new ArrayList();
		Map map = null;
		String from="";
		String to="";
		String[] Depature = request.getParameterValues("Depature");
		for(int i=0; i<Depature.length; i++)
		{
		from=from+Depature[i]+"";
		}
		String[] Destination = request.getParameterValues("Destination");
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
		String cat="";
		String time=request.getParameter("Time");
		String[] Category=request.getParameterValues("Category");
		for(int i=0; i<Category.length; i++)
		{
		cat=cat+Category[i]+"";
		}
		String cost=request.getParameter("Cost");
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travels","root","root"); 
		              
		    
		PreparedStatement ps=con.prepareStatement("select distinct name,age,gender,pno,email,seatno from passengerdetails where depature=? and destination=? and date=? and time=? and category=? and cost=? order by seatno");
		ps.setString(1,from);
		ps.setString(2,to);
		ps.setString(3,date);
		ps.setString(4,time);
		ps.setString(5,cat);
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
				map = new HashMap<>();
				map.put("SeatNo", rs.getString("seatno"));
				map.put("Name",rs.getString("name"));
				map.put("Age", rs.getString("age"));
				map.put("Gender", rs.getString("gender"));
				map.put("Pno", rs.getString("pno"));
				map.put("Email", rs.getString("email"));
				list.add(map);   
		}
		System.out.println(list);
		ses.setAttribute("list", list);
		if(list.isEmpty())
		{
		response.sendRedirect("Warning.html");
		}
		else{
		response.sendRedirect("viewpassenger.jsp");
		}
		}
		catch (Exception e2) {e2.printStackTrace();}            
		finally{out.close();}  
	}
}