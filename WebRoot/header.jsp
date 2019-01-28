<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="UTF-8"%>

<%String username = null;
	if (session.getAttribute("username") != null) {
		username = session.getAttribute("username").toString();
	}
	int userid=0; 
   	if(session.getAttribute("userid")!=null){
   		userid=Integer.parseInt(session.getAttribute("userid").toString());
   	}
   	int usertype=-1;
   	if(session.getAttribute("usertype")!=null){
   		usertype=Integer.parseInt(session.getAttribute("usertype").toString());
   	}
	%>
<!-- header -->
	<div class="agileits_header">
		<div class="w3l_search">
			<form action="XbjSearchCheck.jsp" method="post">
				<input type="text" name="Product" value="查找商品.."
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '查找商品..';}"
					required=""> <input type="submit" value=" ">
			</form>
		</div>
		<div class="product_list_header">
			<div style="cursor: pointer;">
				<span class="glyphicon glyphicon-shopping-cart my-cart-icon"><i
					class="badge badge-notify my-cart-badge"></i></span>
			</div>
		</div>
		<%
			if(username!=null){
		 %>
		<div class="w3l_header_right" style = "color:#fff;display: inline-block;
padding-left: 6em;height:34px;font-size:18px;padding-top:12px;margin-right:20px;width:242px;"><%=username %></div>
		<%
			}
			else{
 		%>
 				<div class="w3l_header_right" style = "color:#fff;display: inline-block;
padding-left: 6em;height:34px;font-size:18px;padding-top:12px;margin-right:20px;width:242px;">请登录</div>
 		<%
 		}
 		 %>

		<div class="w3l_header_right" style ="padding-left:2em">
		
			<ul>
				<li class="dropdown profile_details_drop">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<i class="fa fa-user" aria-hidden="true"></i>
				<span class="caret"></span></a>
					<div class="mega-dropdown-menu">
						<div class="w3ls_vegetables">
							<ul class="dropdown-menu drp-mnu">
								<% if(username!=null){ %>
								<li><a href="userInfo.jsp">个人信息</a></li>
								<%}else{ %>
								<li><a href="login.jsp">登录&注册</a></li>
								<%} %>
								<li><a href="out.jsp">退出</a></li>
							</ul>
						</div>
					</div></li>
			</ul>
		</div>
		
		<div class="clearfix"></div>
	</div>
	<!-- //script-for sticky-nav -->
	<div class="logo_products">
		<div class="container">
			<div class="w3ls_logo_products_left">
				<h1><a href="index.jsp"><span>Grocery</span> Store</a></h1>
			</div>
			<div class="w3ls_logo_products_left1">
				<ul class="special_items">
					<li><a href="index.jsp">首页</a><i>/</i></li>
					<%if(session.getAttribute("usertype")!=null&&session.getAttribute("usertype").equals(0)){ %>
					<li><a href="managegoods.jsp?kind=0">商品管理</a><i>/</i></li>
					<%} %>
					<%if(session.getAttribute("usertype")!=null&&session.getAttribute("usertype").equals(0)){ %>
					<li><a href="AdminOrderSearch.jsp">订单管理</a><i>/</i></li>
					<%} else{
					%>
					<li><a href="OrderSearch.jsp">订单查询</a><i>/</i></li>
					<%} %>
					<li><a href="about.jsp">关于我们</a></li>
				</ul>
			</div>
			<div class="w3ls_logo_products_left1">
				<ul class="phone_email">
					<li><i class="fa fa-phone" aria-hidden="true"></i>12345678910</li>
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:123456789@qq.com">123456789@qq.com</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //header -->
	
	
	
	<form action="createOrdering.jsp" method="post" style="display: none" id="create-order-form">
	<input type="hidden" id="str" name="str">
</form>
<script src="js/bootstrap.min.js"></script>
<script>
function createOrdering(){
		console.log("created!");
		var str="";
		var products = JSON.parse(localStorage.products);
	        for(var i =0;i<products.length;i++){
				str += products[i].id+"|"+products[i].name+"|"+products[i].price+"|"+products[i].quantity+"|";
	        }
        document.getElementById("str").value = str;
	         document.getElementById("create-order-form").submit();

		}
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
