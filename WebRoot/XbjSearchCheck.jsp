<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="utf-8"%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>XbjSearchCheck.jsp</title>
    
	<%@ include file="head.jsp" %>
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
				<li>搜索结果</li>
			</ul>
		</div>
	</div>
<!-- //products-breadcrumb -->
<!-- banner -->
	<div class="banner">
	
	<!-- banner_nav_left -->
	<%@include file="navigation.jsp" %>
	<!-- banner_nav_left -->
		<div class="w3l_banner_nav_right">
			<div class="w3ls_w3l_banner_nav_right_grid w3ls_w3l_banner_nav_right_grid_sub">
				<h3>搜索结果</h3>
				<div class="w3ls_w3l_banner_nav_right_grid1">
				
					<%
						request.setCharacterEncoding("utf-8");
						ResultSet rs = null;
						String keyword = request.getParameter("Product");
					%>
					<h6 align="center">对于关键词"<%=keyword %>"检索结果如下：</h6>
					<% 
						String sql = "SELECT * FROM Goods WHERE goodsname LIKE '%"+keyword+"%'or describe LIKE'%"+keyword+"%'";
						rs = stmt.executeQuery(sql);
						
						while(rs.next()){
							String goodsname = rs.getString("goodsname");
							int goodsid = rs.getInt("goodsid");
							float preprice = rs.getFloat("preprice");
							float nowprice = rs.getFloat("nowprice");
							String imgurl = rs.getString("picture");
					%>
					
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
											<a href="single.jsp?goodsid=<%=goodsid%>"><img src="<%=imgurl%>" alt=" " class="img-responsive" height="140" width="140"/></a>
											<p align="center"><%=goodsname %></p>
											<h4 align="center">￥<%=nowprice %> <span>￥<%=preprice %></span></h4>
										</div>
										<div class="snipcart-details">
											<button class="btn btn-danger my-cart-btn hvr-sweep-to-right" data-id="<%=goodsid %>" data-name="<%=goodsname %>" data-summary="summary <%=goodsid %>" data-price="<%=nowprice %>" data-quantity="1" data-image="<%=imgurl%>">加入购物车</button>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>	<%}rs.close(); %>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
<!-- //banner -->

<!-- footer -->	
<%@include file="footer.jsp" %>
<!-- footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<script type="text/javascript" id="snipcart" src="js/snipcart.js" data-api-key="ZGQxNzVjZTItOWRmNS00YjJhLTlmNGUtMDE4NjdiY2RmZGNj"></script>
<!-- here stars scrolling icon -->
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
