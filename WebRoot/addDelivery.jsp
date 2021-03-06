<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
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

<title>addDelivery</title>
<%@ include file="head.jsp" %>

<script src="js/cityselect.js"></script>
<link href="css/cityLayout.css" type="text/css" rel="stylesheet">
</head>

<body>
<%
   	Connection conn = null;
	Statement stmt = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
 %>
	<!-- header -->
	<%@ include file="header.jsp" %>
	<!-- header -->
	
	<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">主页</a><span>|</span></li>
				<li><i class="fa fa-user" aria-hidden="true"></i><a href="userInfo.jsp">个人信息</a><span>|</span></li>
				<li>添加地址</li>
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
	<!-- mail -->
	<script>
		$(function(){
			init_city_select($("#sel"));
		});
		function getValue() {
			alert($('#sel').val());
		}
	</script>
		<div class="mail">
			<h3>添加地址</h3>
			<div class="agileinfo_mail_grids">
				<div class="col-md-8 agileinfo_mail_grid_right">
					<form action="check_AddDelivery.jsp" method="post">
						<div class="col-md-6 wthree_contact_left_grid  col-md-offset-6">
							<label>所在地区<i>*</i></label>
							<input name="sel" id="sel"  type="text"  class="city_input" readonly="readonly" required="">
							<label>详细地址<i>*</i></label>
							<textarea name="detail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required=""></textarea>
							<label>收货人姓名<i>*</i></label>
							<input name="delname" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required="" type="text">
							<label>电话/手机号码<i>*</i></label>
							<input name="phone" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required="" type="text">
							<input checked="" class="i-chk" name="delitype" id="delitype" type="checkbox"> 
							<label>设置为默认收货地址</label>
							
						</div>
						<div class="col-md-6 wthree_contact_left_grid  col-md-offset-6">
							<input type="reset" value="Clear">
							<input type="submit" value="Submit">
						</div>
						
						
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //mail -->
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- banner -->
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
