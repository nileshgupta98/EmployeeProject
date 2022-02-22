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
        	statement = conn.prepareStatement("delete from emp where ID=?");
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
    statement.setInt(1,ID);
    statement.executeUpdate();

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Deleted Successfully!!!</h1>
</body>
</html>