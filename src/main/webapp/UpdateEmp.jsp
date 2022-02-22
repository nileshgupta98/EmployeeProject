<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%!
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","Ngupta@123");
        	statement = conn.prepareStatement("update emp set salary=? where ID=?;");
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
    
    int id = Integer.parseInt(request.getParameter("ID"));
    int salary = Integer.parseInt(request.getParameter("salary"));
	out.print(id);
    statement.setInt(1,salary);
    statement.setInt(2,id);
    statement.executeUpdate();

    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Updated Successfully!!!</h1>
</body>
</html>