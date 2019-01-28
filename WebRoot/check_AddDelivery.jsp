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
    
    <title> check_AddDelivery</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<!-- header -->
<%@ include file="header.jsp" %>
<!-- header -->	 
  <body>
   <%
  	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
   	request.setCharacterEncoding("UTF-8");
   
 	String sel=request.getParameter("sel");
 	String detail=request.getParameter("detail");
 	String delname=request.getParameter("delname");
 	String phone=request.getParameter("phone");
 	String delitype=request.getParameter("delitype");
 	String province,city,area;
 	String[] b = sel.split("-"); 
 	province=b[0];
 	city=b[1];
 	area=b[2];
 	int delitypes;
 	if(delitype==null){
 		delitypes=0;
 	}else{
 		delitypes=1;
 		String SQL="Update Delivery set delitype=0 WHERE userid='"+userid+"'";
		stmt.executeUpdate(SQL);
 	}
 	
 	
	String sql="INSERT INTO Delivery(userid,province,city,area,detail,delitype,phone,delname) VALUES (?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, userid);
	pstmt.setString(2, province);
	pstmt.setString(3, city);
	pstmt.setString(4, area);
	pstmt.setString(5, detail);
	pstmt.setInt(6, delitypes);
	pstmt.setString(7, phone);
	pstmt.setString(8, delname);
	pstmt.execute();
	response.sendRedirect("userInfo.jsp");
 %>
  </body>
</html>
