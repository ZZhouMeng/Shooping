<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>delectDelivery</title>
  </head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String deliveryid=request.getParameter("deliveryid");
 	
 	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String sql="DELETE FROM Delivery WHERE deliveryid = '"+deliveryid+"' ";
	stmt.executeUpdate(sql); 
	response.sendRedirect("userInfo.jsp");
 %>
 <body>
 </body>

</html>
