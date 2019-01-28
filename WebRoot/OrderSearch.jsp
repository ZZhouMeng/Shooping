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

<title>OrderSearch</title>
<%@ include file="head.jsp" %>
  </head>

<body>
<!-- header -->
	<%@ include file="header.jsp" %>
	<!-- header -->
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet user = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
	String sql;

	sql = "select * from Users where username='"+username+"'";
	user = stmt.executeQuery(sql);
	String email=null;
	String phone=null;
	String sex=null;
	float account=0.1f;
	if(user.next()){
		userid=Integer.parseInt(user.getString("userid"));
		email=user.getString("email");
		phone=user.getString("phone");
		sex=user.getString("sex");
		if(sex==null){
			sex="未填写";
		}
		account= Float.parseFloat(user.getString("account"));
		user.close();
	}
%>

	
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
				<h3>所有订单</h3>
				<div class="banner-bottom-grid1 userInfo1-grid">
					<ul>
						<li><i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i></li>
						<li>订单管理 </li>
						<table class="table">
							<tr>
								<td>订单编号</td>
							  	<td>收件人</td>
							    <td>收件地址</td>
							    <td>电话/手机</td>
							    <td>交易时间</td>
							    <td>订单状态</td>
							    <td>查看详情</td>
						    <tr/>
						    
						     <%
						     	Statement stmt1 = null;
						     	stmt1 = conn.createStatement();
								ResultSet orders = null;
								String sql2 = "select distinct orderid,time,deliveryid,statement from Ordering where userid='"+userid+"' order by time desc";
							    orders = stmt.executeQuery(sql2);
						 		String province,city,area,detail,tel,type,delname,time,state=null,orderid;
						 		int delitype,deliveryid,statement;
								while(orders.next()){
									orderid=orders.getString("orderid");
									deliveryid=Integer.parseInt(orders.getString("deliveryid"));
									statement=Integer.parseInt(orders.getString("statement"));
									if(statement==0){
										state="未发货";
									}else if(statement==1){
										state="已发货";
									}else if(statement==2){
										state="订单已完成";
									}
									time=orders.getString("time");
									ResultSet delivery = null;
									String sql3 = "select * from Delivery where deliveryid='"+deliveryid+"'";
									delivery = stmt1.executeQuery(sql3);
									if(delivery.next()){	
										province=delivery.getString("province");
										city=delivery.getString("city");
										area=delivery.getString("area");
										detail=delivery.getString("detail");
										tel=delivery.getString("phone");
										delname=delivery.getString("delname");

							 %> 
							  <tr>
							  	<td><%=orderid %></td>
							 	<td><%=delname %></td>
							 	<td><%=province %>&nbsp;<%=city %>&nbsp;<%=area %>&nbsp;<%=detail %></td>
							 	<td><%=tel %></td>
							 	<td><%=time %></td>
							 	<td><%=state %></td>
							 	<td><a href="OrderDetail.jsp?orderid=<%=orderid%>">订单详情</a></td>
							 
							 </tr>
							 <%
								 }
								delivery.close();
								}orders.close();
							  %>
						</table>
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
