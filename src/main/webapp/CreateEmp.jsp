<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%!
    
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","Ngupta@123");
        	statement = conn.prepareStatement("insert into emp values (?,?,?,?);");
    	}catch(SQLException e){
    		System.out.print("SQL exception");
    	}catch(ClassNotFoundException ec){
    		System.out.print("Class not found");
    	}
    }
    
    public void jsDestroy() throws SQLException{
    	statement.close();
		conn.close();
    	
    }
    
    %>
    
    
    <%
    
    int ID = Integer.parseInt(request.getParameter("ID"));
    String last_name = request.getParameter("lastname");
    String first_name = request.getParameter("firstname");
    int salary = Integer.parseInt(request.getParameter("salary"));
	
    statement.setInt(1,ID);
    statement.setString(2,last_name);
    statement.setString(3,first_name);
    statement.setInt(4,salary);
    
    
    statement.executeUpdate();

    %>
    
    <h1>Added Successfully!!!</h1>
  