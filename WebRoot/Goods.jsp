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

<title>Goods</title>
<%@ include file="head.jsp" %>

</head>
<%	
	
   	int Categoryid=Integer.parseInt(request.getParameter("categoryid"));
   	Connection conn = null;
	Statement stmt = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
	String sql2="select * from Category where categoryid="+Categoryid+"";
	ResultSet Category = null;
	Category = stmt.executeQuery(sql2);
	String categorynames=null;
	if(Category.next()){
		categorynames=Category.getString("categoryname");
	}
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
				<li><%=categorynames %></li>
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
		<div class="w3ls_w3l_banner_nav_right_grid w3ls_w3l_banner_nav_right_grid_sub">
				<h3 class="w3l_fruit"><%=categorynames %></h3>
				<div class="w3ls_w3l_banner_nav_right_grid1 w3ls_w3l_banner_nav_right_grid1_veg">
				<%String sql3="select * from Goods where categoryid="+Categoryid+"AND display=1";
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
											<a href="single.jsp?goodsid=<%=goodsid%>"><img src="<%=picture%>" alt=" " class="img-responsive" style="width:140px;height:140px;"/></a>
											<p align="center"><%=goodsname %></p>
											<h4 align="center">￥<%=nowprice %> <span>￥<%=preprice %></span></h4>
										</div>
										<div class="snipcart-details">
											<button class="btn btn-danger my-cart-btn hvr-sweep-to-right" data-id="<%=goodsid %>" data-name="<%=goodsname %>" data-summary="summary <%=goodsid %>" data-price="<%=nowprice %>" data-quantity="1" data-image="<%=picture%>">加入购物车</button>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
				<!-- 一个商品展示 -->
		<%}Goods.close(); %>	
			</div>
		</div>		
		
	</div>
	<div class="clearfix"></div>
</div>

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
