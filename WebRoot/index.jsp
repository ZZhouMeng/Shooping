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

<title>index</title>
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
<!-- banner -->
	<div class="banner">
	
	<!-- banner_nav_left -->
	<%@include file="navigation.jsp" %>
	<!-- banner_nav_left -->
	
	<!--banner_nav_right  -->
	<div class="w3l_banner_nav_right">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="w3l_banner_nav_right_banner">
								<h3>休闲美食<span>应有尽有</span> 价廉物美</h3>
								<div class="more">
									<a href="Goods.jsp?categoryid=3" class="button--saqui button--round-l button--text-thick" data-text="立即购买">立即购买</a>
								</div>
							</div>
						</li>
						<li>
							<div class="w3l_banner_nav_right_banner1">
								<h3>新鲜水果每一天<span></span> 健康生活每一刻</h3>
								<div class="more">
									<a href="Goods.jsp?categoryid=7" class="button--saqui button--round-l button--text-thick" data-text="立即购买">立即购买</a>
								</div>
							</div>
						</li>
						<li>
							<div class="w3l_banner_nav_right_banner2">
								<h3>爆款直降 <i>激爽一下</i> 畅快痛饮</h3>
								<div class="more">
									<a href="Goods.jsp?categoryid=6" class="button--saqui button--round-l button--text-thick" data-text="立即购买">立即购买</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</section>
			<!-- flexSlider -->
				<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
				<script defer src="js/jquery.flexslider.js"></script>
				<script type="text/javascript">
				$(window).load(function(){
				  $('.flexslider').flexslider({
					animation: "slide",
					start: function(slider){
					  $('body').removeClass('loading');
					}
				  });
				});
			  </script>
			<!-- //flexSlider -->
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- top-brands -->
	<div class="top-brands">
		<div class="container">
			<h3>爆款商品</h3>
			<div class="agile_top_brands_grids">

			<%		String sql3="select top 4 *  from Goods order by sale desc";
					ResultSet Goods = null;
					Goods = stmt.executeQuery(sql3);
					int goodsid=0;
					float preprice=0,nowprice=0;
					String goodsname=null,describe=null,picture=null;
					while(Goods.next()){
						goodsid=Integer.parseInt(Goods.getString("goodsid"));
						preprice=Float.parseFloat(Goods.getString("preprice"));
						nowprice=Float.parseFloat(Goods.getString("nowprice"));
						goodsname=Goods.getString("goodsname");
						describe=Goods.getString("describe");
						picture=Goods.getString("picture");
						
					%>
				<div class="col-md-3 top_brand_left">
					<div class="hover14 column">
						<div class="agile_top_brand_left_grid">
							<div class="tag" style="z-index:999;"><img src="images/tag.png" alt=" " class="img-responsive" /></div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block" >
										<div class="snipcart-thumb">
											<a href="single.jsp?goodsid=<%=goodsid%>"><img src="<%=picture%>" alt=" " class="img-responsive" style="width:140px;height:140px;"/></a>
											<p align="center"><%=goodsname %></p>
											<h4 align="center">￥<%=nowprice %> <span>￥<%=preprice %></span></h4>
										</div>
										<div class="snipcart-details top_brand_home_details">
											<button class="btn btn-danger my-cart-btn hvr-sweep-to-right" data-id="<%=goodsid %>" data-name="<%=goodsname %>" data-summary="summary <%=goodsid %>" data-price="<%=nowprice %>" data-quantity="1" data-image="<%=picture%>">加入购物车</button>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
				<%}Goods.close(); %>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //top-brands -->
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
