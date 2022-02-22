<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%!
    
   	Connection conn;
    Statement statement;
    ResultSet resultSet;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","Ngupta@123");
        	statement = conn.createStatement();
        	resultSet = statement.executeQuery("Select * from emp;");
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
    
 <table>
 	<tr>
 		<th> ID </th>
 		<th> FirstName</th>
 		<th> LastName </th>
  		<th> salary </th>
 	</tr>
 	 		<% while(resultSet.next()){ %>
 	
 		<tr> 
 			<td><%=resultSet.getInt(1) %></td> 
 			<td><%=resultSet.getString(2) %></td> 
 			<td><%=resultSet.getString(3) %></td> 
 			<td><%=resultSet.getInt(4) %></td> 
 		</tr>
 		 	 		<% } %>

 </table>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H1> Here </H1>
</body>
</html>