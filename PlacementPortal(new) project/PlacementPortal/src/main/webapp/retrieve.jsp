<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mysql";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>PLACEMENT PORTAL</h1>
<table border="1">
<tr>
<th>Stu_id</th>
<th>Stu_name</th>
<th>Stu_mail</th>
<th>Stu_address</th>
<th>Year</th>
<th>Contact</th>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from personaldetails";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Stu_id") %></td>
<td><%=resultSet.getString("Stu_name") %></td>
<td><%=resultSet.getString("Stu_mail") %></td>
<td><%=resultSet.getString("addr") %></td>
<td><%=resultSet.getString("year") %></td>
<td><%=resultSet.getString("contact") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table> 
</body>
</html>