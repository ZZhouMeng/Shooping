<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="object.*" %>
<jsp:useBean id="myGoods" class="service.GoodsDao" scope="page"></jsp:useBean>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	Goods goods=new Goods();
	goods.setGoodsid(id);
	myGoods.deleteGoods(goods);
 %>

