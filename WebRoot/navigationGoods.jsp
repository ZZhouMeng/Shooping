<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="UTF-8"%>
<%@ page import="object.*" %>
<jsp:useBean id="myCategory" class="service.CategoryDao" scope="page"></jsp:useBean>
<div class="w3l_banner_nav_left">
	<nav class="navbar nav_bottom"> <!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header nav_2">
		<button type="button" class="navbar-toggle collapsed navbar-toggle1"
			data-toggle="collapse" data-target="#bs-megadropdown-tabs">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
		<ul class="nav navbar-nav nav_1">
			<%		
			int categoryid=0;
			String categoryname="";
			for(int i=0;i<myCategory.getCategory().size();i++){
				categoryid=myCategory.getCategory().get(i).getCategoryid();
				categoryname=myCategory.getCategory().get(i).getCategoryname();
			%>
			<li><a href="managegoods.jsp?kind=<%=categoryid%>" class="menu-li"><%=categoryname %></a></li>
			<%} %>
			
		</ul>
	</div>
	<!-- /.navbar-collapse --> </nav>
</div>