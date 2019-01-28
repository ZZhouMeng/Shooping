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

<title>about</title>
<%@ include file="head.jsp" %>

</head>
<%
   	Connection conn = null;
	Statement stmt = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
 %>
<body>
<!-- header -->
<%@ include file="header.jsp" %>
<!-- header -->	
<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">主页</a><span>|</span></li>
				<li>关于我们</li>
			</ul>
		</div>
	</div>
<!-- //products-breadcrumb -->
<!-- banner -->
	<div class="banner">
	
	<!-- banner_nav_left -->
	<%@include file="navigation.jsp" %>
	<!-- banner_nav_left -->
	
	<!--banner_nav_right  -->
	<div class="w3l_banner_nav_right">
<!-- about -->
		<div class="privacy about">
			<h3>关于我们</h3>
			<p class="animi">网上商城系统又称在线商城系统，是一个功能完善的在线购物系统，主要为在线销售和在线购物服务。其功能主要包含商品的管理、会员的管理、订单的管理、库存的管理、优惠的管理、在线支付等。</p>
			<div class="agile_about_grids">
				<div class="col-md-6 agile_about_grid_right">
					<img src="images/timg.jpg" alt=" " class="img-responsive" />
				</div>
				<div class="col-md-6 agile_about_grid_left">
					<ol>
						<li>用户登录、注册、个人信息</li>
						<li>浏览商品</li>
						<li>购物功能</li>
						<li>管理员发布、删除、修改商品</li>
					</ol>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //about -->
		</div>
		<div class="clearfix"></div>
	</div>
<!-- //banner -->
<!-- team -->
	<div class="team">
		<div class="container">
			<h3>我们的团队</h3>
			<div class="agileits_team_grids">
				<div class="col-md-2 agileits_team_grid  col-md-offset-1">
					<img src="images/zm.jpg" alt=" " class="img-responsive" />
					<h4>周萌</h4>
				</div>
				<div class="col-md-2 agileits_team_grid">
					<img src="images/zlx.jpg" alt=" " class="img-responsive" />
					<h4>詹璐茜</h4>
				</div>
				<div class="col-md-2 agileits_team_grid">
					<img src="images/zd.jpg" alt=" " class="img-responsive" />
					<h4>周丹</h4>
				</div>
				<div class="col-md-2 agileits_team_grid">
					<img src="images/zyl.jpg" alt=" " class="img-responsive" />
					<h4>郑燕浪</h4>
				</div>
				<div class="col-md-2 agileits_team_grid">
					<img src="images/xbj.jpg" alt=" " class="img-responsive" />
					<h4>项秉禁</h4>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //team -->


<!-- footer -->	
<%@include file="footer.jsp" %>
<!-- footer -->
	
<!-- Bootstrap Core JavaScript -->

<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
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
