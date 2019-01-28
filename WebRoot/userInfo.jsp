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

<title>userInfo</title>
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
		
	String sql= "select * from Users where username='"+username+"'";
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
				<li>个人信息</li>
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
				<h3>个人信息</h3>
				<div class="banner-bottom-grid1 userInfo1-grid">
					<ul>
						<li><i class="glyphicon glyphicon-user" aria-hidden="true"></i></li>
						<li>用户名 <span> <%=username %></span></li><br/>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></li>						
						<li>Email <span> <%=email %></span></li><br/>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i></li>
						<li>Phone <span> <%=phone %></span></li><br/>
						<li><i class="glyphicon glyphicon-usd" aria-hidden="true"></i></li>
						<li>余额 <span> <%=account %></span></li><br/>
						
					</ul>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i></li>
						<li>地址管理 <span><a href="addDelivery.jsp?userid=<%=userid%>"><button type="button" class="btn btn-success" >添加地址</button></a></span></li>
						<table class="table">
							<tr>
							  	<td>收件人</td>
							    <td>所在地区</td>
							    <td>详细地址</td>
							    <td>电话/手机</td>
							    <td>操作</td>
							    <td></td>
						    <tr/>
						     <%
								ResultSet delivery = null;
								String sql2 = "select * from Delivery where userid='"+userid+"'";
							    delivery = stmt.executeQuery(sql2);
						 		String province,city,area,detail,tel,type,delname;
						 		int delitype,deliveryid;
								while(delivery.next()){
									deliveryid=Integer.parseInt(delivery.getString("deliveryid"));
									province=delivery.getString("province");
									city=delivery.getString("city");
									area=delivery.getString("area");
									detail=delivery.getString("detail");
									tel=delivery.getString("phone");
									delname=delivery.getString("delname");
									delitype=Integer.parseInt(delivery.getString("delitype"));
									if(delitype==1){
										type="默认地址";
									}else{
										type="";
									}
										
							 %> 
							  <tr>
							 	<td><%=delname %></td>
							 	<td><%=province %>&nbsp;<%=city %>&nbsp;<%=area %></td>
							 	<td><%=detail %></td>
							 	<td><%=tel %></td>
							 	<td><a href="editDelivery.jsp?deliveryid=<%=deliveryid%>">修改|</a><a href="delectDelivery.jsp?deliveryid=<%=deliveryid%>">删除</a></td>
							 	<td><%=type %></td>
							 </tr>
							
							 <%
								 }
								delivery.close();
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
