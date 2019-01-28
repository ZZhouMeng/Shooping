<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 	response.setContentType("text/html;charset=utf-8"); 
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>checkOrdering</title>
  </head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String orderid=request.getParameter("orderid");
 	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String sql="Update Ordering set statement=2 where orderid='"+orderid+"'";
	stmt.executeUpdate(sql);
	response.sendRedirect("OrderDetail.jsp?orderid="+orderid);
 %>
 <body>
 </body>

</html>
