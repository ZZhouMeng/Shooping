<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
    <%@ include file="head.jsp" %>
  </head>

<body>
<%
	
	Connection conn = null;
	Statement stmt = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
 %>
<%
  	if(request.getParameter("type")!=null){
  		String type=request.getParameter("type");
  		if(type.equals("1")){
  		 	out.print("<script>alert('用户名输入错误');</script>");
  		}else if(type.equals("2")){
  			out.print("<script>alert('密码输入错误');</script>");
  		}else if(type.equals("4")){
  			out.print("<script>alert('两次密码输入不一致');</script>");
  		}else if(type.equals("5")){
  			out.print("<script>alert('用户名已注册');</script>");
  		}else if(type.equals("6")){
  			out.print("<script>alert('请以管理员身份登录');</script>");
  		}
  	}
   %>
	<!-- header -->
	<%@ include file="header.jsp" %>
	<!-- header -->
	
	<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">主页</a><span>|</span></li>
				<li>登 录 & 注 册</li>
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
	<!-- login -->
		<div class="w3_login">
			<h3 >登 录 & 注 册</h3>
			<div class="w3_login_module">
				<div class="module form-module">
				  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
					<div class="tooltip">点 我 注 册</div>
				  </div>
				  <div class="form">
					<h2 align="center">登 录</h2>
					<form name="login" action="checkLogin.jsp" method="post">
					  <input type="text" name="Username" placeholder="用户名" required=" " pattern="^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$" title="只能输入5-20个以字母开头、可带数字、“_”、“.”的字串 ">
					  <input type="password" name="Password" placeholder="密码" required=" " pattern="^([a-zA-Z0-9]){5,19}$" title="只能输入5-20个带字母或数字的字串">
					  <input type="submit" value="登录">
					</form>
				  </div>
				  <div class="form">
					<h2 align="center">注 册</h2>
					<form name="register" action="checkRegister.jsp" method="post">
					  <input type="text" name="Username" placeholder="用户名" required=" " pattern="^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$" title="只能输入5-20个以字母开头、可带数字、“_”、“.”的字串 ">
					  <input type="password" name="Password" placeholder="密码" required=" " pattern="^([a-zA-Z0-9]){5,19}$" title="只能输入5-20个带字母或数字的字串">
					  <input type="password" name="rePassword" placeholder="确认密码" required=" " pattern="^([a-zA-Z0-9]){5,19}$" title="只能输入5-20个带字母或数字的字串">
					  <input type="email" name="Email" placeholder="邮箱" required=" ">
					  <input type="tel" name="Phone" placeholder="电话号码" required=" " pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}">
					  <input type="submit" value="注册">
					</form>
				  </div>
				</div>
			</div>
			<script>
				$('.toggle').click(function(){
				  // Switches the Icon
				  $(this).children('i').toggleClass('fa-pencil');
				  // Switches the forms  
				  $('.form').animate({
					height: "toggle",
					'padding-top': 'toggle',
					'padding-bottom': 'toggle',
					opacity: "toggle"
				  }, "slow");
				});
			</script>
		</div>
	<!-- //login -->
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- banner -->
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
