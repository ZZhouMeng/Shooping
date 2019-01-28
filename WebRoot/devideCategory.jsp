<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="object.*" %>
<jsp:useBean id="myGoods" class="service.GoodsDao" scope="page"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	int kind=0;
	kind=Integer.parseInt((String)request.getParameter("kind"));
	int id=0;
	id=Integer.parseInt((String)request.getParameter("id"));
	//System.out.println("kind"+kind+"id: "+id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<%
		if(kind==0){
		for(int i=(id-1)*8;i<myGoods.selectGoods().size()&&(i < (id-1)*8+8);i++){%>
			<div class="col-md-3  goods">
				<div class="hover14 column">
				<div class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
					<div class="agile_top_brand_left_grid_pos">
						<img src="images/offer.png" alt=" " class="img-responsive" />
					</div>
					<div class="agile_top_brand_left_grid1">
						<figure>
							<div class="snipcart-item block">
								<div class="snipcart-thumb">
									<a href="single.jsp"><img src="<%=myGoods.selectGoods().get(i).getPicture()%>" alt=" " class="img-responsive"  style="width:140px;height:140px;"/></a>
									<p align="center"><%=myGoods.selectGoods().get(i).getGoodsname() %></p>
									<h4 align="center">¥<%=myGoods.selectGoods().get(i).getNowprice() %> <span>¥<%=myGoods.selectGoods().get(i).getPreprice()%></span></h4>
								</div>
								<div class="snipcart-details">
									<a class="btn btn-danger my-cart-btn hvr-sweep-to-right" onclick="doDel(<%=myGoods.selectGoods().get(i).getGoodsid()%>)">删除</a><br><br>
									<a class="btn btn-danger my-cart-btn hvr-sweep-to-right" href="reeditgoods.jsp?type=<%=myGoods.selectGoods().get(i).getGoodsid()%>">修改</a>
								</div>
							</div>
						</figure>
					</div>
				</div>
				</div>
			</div>
			<%}}
			else{
			
	
	
			for(int i=(id-1)*8;i<myGoods.selectKind(kind).size()&&(i < (id-1)*8+8);i++){%>
			<div class="col-md-3  goods">
				<div class="hover14 column">
				<div class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
					<div class="agile_top_brand_left_grid_pos">
						<img src="images/offer.png" alt=" " class="img-responsive" />
					</div>
					<div class="agile_top_brand_left_grid1">
						<figure>
							<div class="snipcart-item block">
								<div class="snipcart-thumb">
									<a href="single.jsp"><img src="<%=myGoods.selectKind(kind).get(i).getPicture()%>" alt=" " class="img-responsive" style="width:140px;height:140px;"/></a>
									<p align="center"><%=myGoods.selectKind(kind).get(i).getGoodsname() %></p>
									<h4 align="center">¥<%=myGoods.selectKind(kind).get(i).getNowprice() %> <span>¥<%=myGoods.selectKind(kind).get(i).getPreprice()%></span></h4>
								</div>
								<div class="snipcart-details">
									<a class="btn btn-danger my-cart-btn hvr-sweep-to-right" onclick="doDel(<%=myGoods.selectKind(kind).get(i).getGoodsid()%>)">删除</a><br><br>
									<a class="btn btn-danger my-cart-btn hvr-sweep-to-right" href="reeditgoods.jsp?type=<%=myGoods.selectKind(kind).get(i).getGoodsid()%>">修改</a>
								</div>
							</div>
						</figure>
					</div>
				</div>
				</div>
			</div>
			<%}}%>
