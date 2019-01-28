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
    
    <title>Check_Consignment</title>
  </head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String orderid=request.getParameter("orderid");
 	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String sql="Update Ordering set statement=1 where orderid='"+orderid+"'";
	stmt.executeUpdate(sql);
	int usertype=-1;
   	if(session.getAttribute("usertype")!=null){
   		usertype=Integer.parseInt(session.getAttribute("usertype").toString());
   		if(usertype == 0){
   			response.sendRedirect("AdminOrderSearch.jsp?orderid="+orderid);
   		}
   		else{
   			response.sendRedirect("OrderSearch.jsp?orderid="+orderid);
   		}
   	}
 %>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
