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
    
    <title>checkLogin</title>
  </head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String Username=request.getParameter("Username");
 	String Password=request.getParameter("Password");
 	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String sql= "select * from Users where username='"+Username+"'";
	rs=stmt.executeQuery(sql);
	if(rs.next()==false){
		response.sendRedirect("login.jsp?type=1");
	}else{
		String pwd=rs.getString("paswd");
		String username=rs.getString("username");
		String userid=rs.getString("userid");
		int usertype=Integer.parseInt(rs.getString("usertype"));
		if(Password.equals(pwd)){
			session.setAttribute("username", username);
			session.setAttribute("userid", userid);
			session.setAttribute("usertype",usertype);
			response.sendRedirect("index.jsp");
		}else{
			response.sendRedirect("login.jsp?type=2");
		}
	}
 %>
 <body>
 
 </body>

</html>
