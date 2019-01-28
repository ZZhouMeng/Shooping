<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="object.*" %>
<jsp:useBean id="myGoods" class="service.GoodsDao" scope="page"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int kind=0;
		kind=Integer.parseInt((String)request.getParameter("kind"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>商品管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <script src="pc/lib/jquery-1.7.2.min.js"></script>
    <script src="pc/js/javaex.min.js"></script>
	
	<%int num=0;int totalpage=1; %>
	<%@ include file="head.jsp" %>
    <script src="js/cityselect.js"></script>
    <link href="css/cityLayout.css" type="text/css" rel="stylesheet">
    <script language="javascript">
    window.onload = function(){
    if(<%=kind%>!=0){
    	document.getElementsByClassName("menu-li")[<%=kind-1%>].style.background = "#84C639";
    }
    }
    function gotopage(x){
  		var xmlhttp = new XMLHttpRequest();
           xmlhttp.open("get","devideCategory.jsp?id="+x+"&kind=<%=kind%>","true");
           xmlhttp.onreadystatechange = function () {
                   if(xmlhttp.readyState == 4) {
                           document.getElementsByClassName("w3ls_w3l_banner_nav_right_grid1")[0].innerHTML = xmlhttp.responseText;
                   }
           }
           xmlhttp.send();
  	}
	function doDel(num){
 		var xmlhttp = new XMLHttpRequest();
           xmlhttp.open("get","deletegoods.jsp?id="+num+"","true");
           xmlhttp.onreadystatechange = function () {
                   if(xmlhttp.readyState == 4) {
                           location.reload();
                   }
           }
           xmlhttp.send();
	}
	</script>
	<style type="text/css">
	.outputhref{
	position:absolute;
	left:85%;
	bottom:45%;
	}
	</style>
  </head>
  
  <body>
    <!-- header -->
	<%@ include file="header.jsp" %>
	<!-- header -->
	<%if(usertype!=0){
		response.sendRedirect("login.jsp?type=6");
	}
	 %>
	<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">主页</a><span>|</span></li>
				<li>商品管理</li>
			</ul>
		</div>
	</div>
	<!-- //products-breadcrumb -->
	<!-- banner -->
	<div class="banner">
	
	<!-- banner_nav_left -->
	<%@include file="navigationGoods.jsp" %>
	<!-- banner_nav_left -->
	<div class="w3l_banner_nav_right">
		<div class="w3ls_w3l_banner_nav_right_grid">
		<br>
		<h3>商品管理</h3>
		<div class="outputhref">
		<a class='btn btn-danger my-cart-btnll hvr-sweep-to-rightl' href="addgoods.jsp">发布商品</a>
		</div>
		<br><br>
		<div class="w3ls_w3l_banner_nav_right_grid1">
		<%
		if(kind==0){
		if(myGoods.selectGoods().size()%8==0){
			if(myGoods.selectGoods().size()!=0){
				totalpage = myGoods.selectGoods().size()/8;	
			}
			else{totalpage = 1;}
		}
		else{
			totalpage = myGoods.selectGoods().size()/8+1;
		}
		for(int i=0;i<myGoods.selectGoods().size()&&i < 8;i++){%>
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
									<a href="single.jsp?goodsid=<%=myGoods.selectGoods().get(i).getGoodsid()%>"><img src="<%=myGoods.selectGoods().get(i).getPicture()%>" alt=" " class="img-responsive"  style="width:140px;height:140px;"/></a>
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
			
			if(myGoods.selectKind(kind).size()%8==0){
			if(myGoods.selectKind(kind).size()!=0){
				totalpage = myGoods.selectKind(kind).size()/8;	
			}
			totalpage = 1;
			}
			else{
				totalpage = myGoods.selectKind(kind).size()/8+1;
			}

			for(int i=0;i<myGoods.selectKind(kind).size()&& i<8;i++){%>
				<!-- 一个商品展示 -->
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
									<a href="single.jsp?goodsid=<%=myGoods.selectKind(kind).get(i).getGoodsid()%>"><img src="<%=myGoods.selectKind(kind).get(i).getPicture()%>" alt=" " class="img-responsive" style="width:140px;height:140px;"/></a>
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
			</div>
		</div>
		</div>
			<div class="clearfix"> </div>
		</div>
		
		<div id="page-select" style="width:100%;height:50px;align-text:center;margin-bottom:10px;text-align:center;">
			<div class="page" style="display:inline-block;">
				<ul id="page" class="pagination" style="display:inline-block;margin：20px auto;margin-left:00px;"></ul>
			</div>		
		</div>


<script>
	javaex.page({
		id : "page",
		pageCount : <%=totalpage%>,	// 总页数
		currentPage : 1,// 默认选中第几页
		position : "left",
		// 返回当前选中的页数
		callback:function(rtn) {
			gotopage(rtn.pageNum);
		}
	});
</script>	
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
	<!-- footer -->	
    <%@include file="footer.jsp" %>
    <!-- footer -->
  </body>
</html>
