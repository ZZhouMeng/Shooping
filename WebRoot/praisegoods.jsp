<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="object.*" %>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	int value=Integer.parseInt(request.getParameter("value"));
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String sql= "update Goods set praisegrade=praisegrade+'"+value+"',praisenum=praisenum+1 where goodsid='"+id+"'";
	stmt.executeUpdate(sql);
 %>