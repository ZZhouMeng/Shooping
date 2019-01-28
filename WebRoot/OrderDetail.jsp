<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>OrderDetail</title>
<%@ include file="head.jsp" %>
  </head>

<body>
<%
   	String orderid=request.getParameter("orderid");
	Connection conn = null;
	Statement stmt = null;
	ResultSet order = null;
%>
<%
	conn = myDB.getConnection();
	stmt = conn.createStatement();
	Statement stmt1 = null;
	stmt = conn.createStatement();
	String sql3="select distinct Ordering.deliveryid,statement,province,city,area,detail,delname,phone,time from Ordering,Delivery where Ordering.deliveryid=Delivery.deliveryid and orderid='"+orderid+"'";
	ResultSet orderDetail = stmt.executeQuery(sql3);
	String province=null,city=null,area=null,detail=null,tel=null,type=null,delname=null,time=null,state=null;
	int delitype,deliveryid,statement=0;
	if(orderDetail.next()){
		statement=Integer.parseInt(orderDetail.getString("statement"));
		if(statement==0){
			state="未发货";
		}else if(statement==1){
			state="已发货";
		}else if(statement==2){
			state="订单已完成";
		}
		time=orderDetail.getString("time");		
		province=orderDetail.getString("province");
		city=orderDetail.getString("city");
		area=orderDetail.getString("area");
		detail=orderDetail.getString("detail");
		tel=orderDetail.getString("phone");
		delname=orderDetail.getString("delname");
	}
	orderDetail.close();
	
	
%>
<!-- header -->
	<%@ include file="header.jsp" %>
	<!-- header -->
	
	<!-- breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">主页</a><span>|</span></li>
				<li>订单管理</li>
			</ul>
		</div>
	</div>
	<!--breadcrumb -->
	
	<!-- banner -->
	<div class="banner">	
		<!-- banner_nav_left -->
		<%@include file="navigation.jsp" %>
		<!-- banner_nav_left -->
		<div class="w3l_banner_nav_right">
		<!-- userinfo -->
		<div class="userInfo">
			<div class="userInfo1">
				<h3>订单信息</h3>
				<div class="banner-bottom-grid1 userInfo1-grid">
					<ul>
						<li><i class="glyphicon glyphicon-tags" aria-hidden="true"></i></li>
						<li>订单编号 <span> <%=orderid %></span></li><br/>
						<li><i class="glyphicon glyphicon-hourglass" aria-hidden="true"></i></li>						
						<li>下单时间 <span> <%=time %></span></li><br/>
						<li><i class="glyphicon glyphicon-user" aria-hidden="true"></i></li>						
						<li>收件人姓名 <span> <%=delname %></span></li><br/>
						<li><i class="glyphicon glyphicon-home" aria-hidden="true"></i></li>
						<li>收件人地址 <span> <%=province %>&nbsp;<%=city %>&nbsp;<%=area %>&nbsp;<%=detail %></span></li><br/>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i></li>
						<li>收件人电话<span> <%=tel %></span></li><br/>
						<li><i class="glyphicon glyphicon-usd" aria-hidden="true"></i></li>
						<li>订单状态<span> <%=state %></span></li><br/>
						
					</ul>
					<ul>
						<li><i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i></li>
						<li>订单 </li>
						<table class="table">
							<tr>
							  	<td>商品</td>
							  	<td>商品名称</td>
							    <td>商品单价</td>
							    <td>数量</td>
							    <td>商品总价</td>
						    <tr/>
						     <%
						     	float sum=0;
						     	String sql= "select * from Ordering,Goods where Ordering.goodsid=Goods.goodsid and orderid='"+orderid+"'";
								order = stmt.executeQuery(sql);
								while(order.next()){
									int goodsnum = order.getInt("number");
									int goodsid=Integer.parseInt(order.getString("goodsid"));
									String picture = order.getString("picture");
									String goodsname=order.getString("goodsname");
									float nowprice=order.getFloat("nowprice");
									sum=sum+nowprice*goodsnum;
									
							 %> 
							  <tr>
							  	<td class="text-center" style="width: 30px;"><a href="single.jsp?goodsid=<%=goodsid%>"><img width="30px" height="30px" src="<%=picture%>"></a></td>
							 	<td><%=goodsname %></td>
							 	<td>￥<%=nowprice %></td>
							 	<td><%=goodsnum %></td>
							 	<td><%=nowprice*goodsnum %></td>
							 </tr>
							 <%
								 }
								order.close();
							  %>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td>总价：￥<%=sum %></td>
						</table>
						<%if(statement==1&&usertype==1){
						  %>
						  <a href="check_Ordering.jsp?orderid=<%=orderid%>"><button type="button" class="btn btn-success" >确认收货</button></a>
						  <% 
						   }else if(statement==0&&usertype==0){%>
						 <a href="Check_Consignment.jsp?orderid=<%=orderid%>"><button type="button" class="btn btn-success" >点击发货</button></a>
						  <% 
						   }%>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- here stars scrolling icon -->
<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 0;"></span>To Top</a>
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<!-- footer -->	
<%@include file="footer.jsp" %>
<!-- footer -->	
<!-- //here ends scrolling icon -->
<script type='text/javascript' src="js/jquery.mycart.js"></script>
<script type="text/javascript">
  $(function () {

    var goToCartIcon = function($addTocartBtn){
      var $cartIcon = $(".my-cart-icon");
      var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
      $addTocartBtn.prepend($image);
      var position = $cartIcon.position();
      $image.animate({
	  
      }, 500 , "linear", function() {
        $image.remove();
      });
    }

    $('.my-cart-btn').myCart({
      classCartIcon: 'my-cart-icon',
      classCartBadge: 'my-cart-badge',
      affixCartIcon: true,
      checkoutCart: function(products) {
        $.each(products, function(){
          console.log(this);
        });
      },
      clickOnAddToCart: function($addTocart){
        goToCartIcon($addTocart);
      },
      getDiscountPrice: function(products) {
        var total = 0;
        $.each(products, function(){
          total += this.quantity * this.price;
        });
        return total * 1;
      }
    });

  });
  </script>
	</body>
</html>
