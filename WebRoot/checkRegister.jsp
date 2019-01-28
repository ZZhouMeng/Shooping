<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="object.User" %>
<%@page import="service.UserDao" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>checkRegister</title>
  </head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String username=request.getParameter("Username");
 	String password=request.getParameter("Password");
 	String repassword=request.getParameter("rePassword");
 	String email=request.getParameter("Email");
 	String phone=request.getParameter("Phone");
 	out.println(username+"  "+password+" "+repassword+" "+email+" "+phone);
%>
<%

 	if(password.equals(repassword)==false){
 		response.sendRedirect("login.jsp?type=4");
 	}
	
 	User user=new User(username,password,email,phone);
 	UserDao userDao=new UserDao();
	if(userDao.addUser(user)==false){
		response.sendRedirect("login.jsp?type=5");
	}else{
		response.sendRedirect("login.jsp");	
	}
 %>
 <body>
 
 </body>

</html>
