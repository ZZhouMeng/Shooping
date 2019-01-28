<%@ page language="java" import="java.util.*" import="java.util.*" import="java.sql.*" pageEncoding="utf-8"%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>single.jsp</title>
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
				<li>商品界面</li>
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
			<div class="w3l_banner_nav_right_banner3">
				<h3>筛选世界品质,让生活精彩!<span class="blink_me"></span></h3>
			</div>
			<% 
				String id = request.getParameter("goodsid").toString();
				String sql = "select * from Goods where goodsid='"+id+"'";
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()){
					String describe = rs.getString("describe");
					String goodsname = rs.getString("goodsname");
					String preprice = rs.getString("preprice");
					String nowprice = rs.getString("nowprice");
					int praisegrade = rs.getInt("praisegrade");
					int praisenum = rs.getInt("praisenum");
					String imgurl = rs.getString("picture");
			%>
			<div class="agileinfo_single">

				<h5><%=goodsname %></h5>
				<div class="col-md-4 agileinfo_single_left">
					<img id="example" src="<%=imgurl %>" alt=" " style=""  class="img-responsive" />
				</div>
				<div class="col-md-8 agileinfo_single_right">
					<div class="rating1">
						<span class="starRating">
							<input id="rating5" type="radio" name="rating" value="5" onclick="ratingChange5(this)" <%if(praisegrade/praisenum==5){%>checked<%}%>>
							<label for="rating5">5</label>
							<input id="rating4" type="radio" name="rating" value="4" onclick="ratingChange5(this)" <%if(praisegrade/praisenum==4){%>checked<%}%>>
							<label for="rating4">4</label>
							<input id="rating3" type="radio" name="rating" value="3" onclick="ratingChange5(this)" <%if(praisegrade/praisenum==3){%>checked<%}%>>
							<label for="rating3">3</label>
							<input id="rating2" type="radio" name="rating" value="2" onclick="ratingChange5(this)" <%if(praisegrade/praisenum==2){%>checked<%}%>>
							<label for="rating2">2</label>
							<input id="rating1" type="radio" name="rating" value="1" onclick="ratingChange5(this)" <%if(praisegrade/praisenum==1){%>checked<%}%>>
							<label for="rating1">1</label>
						</span>
					</div>
					<div class="w3agile_description">
						<h4>商品简介:</h4>
						<p><%=describe %></p>
					</div>
					<div class="snipcart-item block">
						<div class="snipcart-thumb agileinfo_single_right_snipcart">
							<h4>¥<%=nowprice %> <span>¥<%=preprice %></span></h4>
						</div>
						<div class="snipcart-details agileinfo_single_right_details">
							<button class="btn btn-danger my-cart-btn hvr-sweep-to-right" data-id="<%=id %>" data-name="<%=goodsname %>" data-summary="summary <%=id %>" data-price="<%=nowprice %>" data-quantity="1" data-image="<%=imgurl%>">加入购物车</button>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<%
			}else{
				out.print("出错了，没找到");
			}
			 %>
		</div>
		<div class="clearfix"></div>
	</div>
<!-- //banner -->
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
							<div class="tag"><img src="images/tag.png" alt=" " class="img-responsive" /></div>
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
  <script type="text/javascript">
  	function ratingChange5(e){
 		var xmlhttp = new XMLHttpRequest();
           xmlhttp.open("get","praisegoods.jsp?id="+<%=id%>+"&value="+e.value+"","true");
           xmlhttp.onreadystatechange = function () {
                   if(xmlhttp.readyState == 4) {
                           location.reload();
                   }
           }
           xmlhttp.send();
	}
  	<%-- function ratingChange5(e){
  		var objdbConn = new ActiveXObject("ADODB.Connection");    
		var strdsn = "Driver={SQL Server};SERVER=(local);UID=test;PWD=123456;DATABASE=shopping";  
		objdbConn.Open(strdsn);       
		objdbConn.Execute("update Goods set praisegrade=praisegrade+'"+e.value+"',praisenum=praisenum+1 where goodsid=<%=id%>");                    // 请写入自己的执行语句    
		objdbConn.Close();
		window.location.reload();     
  	} --%>
  </script>
 
  
</body>
</html>