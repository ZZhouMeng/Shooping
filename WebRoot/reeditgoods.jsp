<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="object.*" %>
<jsp:useBean id="myGoods" class="service.GoodsDao" scope="page"></jsp:useBean>
<jsp:useBean id="myCategory" class="service.CategoryDao" scope="page"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setCharacterEncoding("utf-8");  
response.setHeader("content-type", "text/html;charset=utf-8");  
response.setContentType("text/html;charset=utf-8");  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑商品内容</title>
    <%@ include file="head.jsp" %>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/cityselect.js"></script>
	<link href="css/cityLayout.css" type="text/css" rel="stylesheet">
	<style type="text/css">
	.special input[type="submit"]{
		margin-left: 5em;
		color:red;
	}
	.footer {
	    padding: 4em 0;
	    background: #212121;
	    position: absolute;
	    bottom: -800px;
	    width:100%;
	}
	</style>
  </head>
  
  <body>
    <%
    int typ=Integer.parseInt(request.getParameter("type"));
    Goods goods=new Goods();
    goods.setGoodsid(typ);
    for(int i=0;i<myGoods.selectGoods().size();i++){
    	if(myGoods.selectGoods().get(i).getGoodsid()==typ){
    		goods=myGoods.selectGoods().get(i);
    	}
    }
     %>
     <!-- header -->
	<%@ include file="header.jsp" %>
	<!-- header -->
	<%if(usertype!=0){
		response.sendRedirect("login.jsp?type=6");
	}
	 %>
	<!-- banner -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">主页</a><span>|</span></li>
				<li>编辑商品</li>
			</ul>
		</div>
	</div>
	<div class="banner">

	<div class="w3l_banner_nav_right1">
	<!-- mail -->
     <div class="mail">
	<h3>修改商品信息</h3>
	<div class="agileinfo_mail_grids1">
		<div class="col-md-8 agileinfo_mail_grid_right">
    <form action="/shopping/servlets/UploadServlet_edit" method="post" enctype="multipart/form-data">
       <img src="<%=goods.getPicture()%>" id="show" style="float:right;width:140px;height:140px;border:5px solid green"><br>     
            商品图片上传：<input class="upload" id="file" name="upload" accept="image/png, image/jpeg, image/gif, image/jpg" type="file" onchange="changepic(this)">
     <br>
    	选择种类:<select name="categoryid">
    	<%for(int i=0;i<myCategory.getCategory().size();i++){
    		out.print("<option value='"+myCategory.getCategory().get(i).getCategoryid()+
    		"'>"+myCategory.getCategory().get(i).getCategoryname()+"</option>");
    	} %>
        </select><br><br>
        商品名称：<input name="goodsname" type="text" value="<%=goods.getGoodsname()%>"><br><br>
        原价：<input name="preprice" type="text" value="<%=goods.getPreprice()%>"><br><br>
        现价：<input name="nowprice" type="text" value="<%=goods.getNowprice()%>"><br><br>
        库存：<input name="pepertory" type="text" value="<%=goods.getPepertory()%>"><br><br>
      <input name="sale" type="hidden"   value="<%=goods.getSale()%>">  
        商品描述：<input name="describe" type="text" value="<%=goods.getDescribe()%>"><br><br>
     <input name="picture" type="hidden" value="<%=goods.getPicture() %>">
     <input name="goodsid" type="hidden" value="<%=goods.getGoodsid() %>">
     <input type="submit" value="提交">
    </form>
    </div></div></div></div></div>
    <script>
    function changepic() {
        var reads= new FileReader();
        f=document.getElementById('file').files[0];
        reads.readAsDataURL(f);
        reads.onload=function (e) {
            document.getElementById('show').src=this.result;
        };
    }
	</script>
	<div class="footer">
	<div class="container">
		<div class="wthree_footer_copy">
			<p>
				Copyright © 2018.Company name All rights reserved.More Templates <a
					href="" target="_blank" title="">Team</a>
				- Collect from <a href="" title=""
					target="_blank">Team</a>
			</p>
		</div>
	</div>
</div>
<div class="footer">
	<div class="container">
		<div class="wthree_footer_copy">
			<p>
				Copyright © 2018.Company name All rights reserved.More Templates <a
					href="" target="_blank" title="">Team</a>
				- Collect from <a href="" title=""
					target="_blank">Team</a>
			</p>
		</div>
	</div>
</div>
  </body>
</html>
