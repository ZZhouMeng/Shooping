<%@ page import="jdk.nashorn.internal.runtime.JSONListAdapter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="beans.Ordering" %>
<%@ page import="beans.Product" %>
<%@ page import="beans.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="beans.Delivery" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
 	response.setContentType("text/html;charset=utf-8"); 
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
    String str= (String)request.getParameter("str");
    List<String> list=new ArrayList<String>();
    StringTokenizer st=new StringTokenizer(str,"|");
    while(st.hasMoreTokens()){
        list.add(st.nextToken());
    }
    int  userid = 0;
    if((String)session.getAttribute("userid") != null){
        userid = Integer.parseInt((String)session.getAttribute("userid"));
    }
    else{
    	response.sendRedirect("login.jsp");
    }
    String username = (String)session.getAttribute("userid");
    int  productid;
    String productname = null;
    float price;
    int  quantity;
    String imgsrc = null;
    float deliveryPrice = 0;
    int j=0;
    if(list.size() == 0){
        return;
    }
    Ordering ordering = new Ordering(userid);
    for(int i = 0;i < list.size()/4;i ++ ){
       	    productid = Integer.parseInt(list.get(j));
            String sql = "select * from Goods where goodsid="+productid;
	    Connection conn = new DBConnect().getConnection("test","123456","shopping");
	    Statement stat = conn.createStatement();
	    ResultSet rs =  stat.executeQuery(sql);
	    if( rs.next() ){
	       productname = rs.getString("goodsname");
	       imgsrc = rs.getString("picture").trim();
	    }
	    stat.close();
	     conn.close();
	     
        price = Float.parseFloat(list.get(j+2));
        quantity = Integer.parseInt(list.get(j+3));
        j+=4;
        //System.out.println(productid+productname+price+quantity+quantity*price+imgsrc);
        ordering.add(productid,productname,price,quantity,quantity*price,imgsrc);
    }
    for(int i = 0;i<ordering.getProducts().size();i++){
        Product product = ordering.getProducts().get(i);
        deliveryPrice +=product.totalPrice;
    }

                               /**********************查询默认收货地址*************************/
    String province = null;
    String city = null;
    String area = null;
    String detail = null;
    String phone = null;
    String deliveryname = null;
    int deliveryid=-1;
    String sql = "select * from Delivery where userid="+userid+"and delitype=1";
    Connection conn = new DBConnect().getConnection("test","123456","shopping");
    Statement stat = conn.createStatement();
    ResultSet rs =  stat.executeQuery(sql);
    if( rs.next() ){
        province = rs.getString("province");
        city = rs.getString("city");
        area = rs.getString("area");
        detail = rs.getString("detail");
        phone = rs.getString("phone");
        deliveryname = rs.getString("delname");
        deliveryid = rs.getInt("deliveryid");
    }
    /************************查询普通地址*******************************/
    List<Delivery> deliveries = new ArrayList<>();
    sql = "select * from Delivery where userid="+userid+"and delitype=0";
    stat = conn.createStatement();
    rs =  stat.executeQuery(sql);
    while( rs.next() ){
        String mprovince = rs.getString("province");
        String mcity = rs.getString("city");
        String marea = rs.getString("area");
        String mdetail = rs.getString("detail");
        String mphone = rs.getString("phone");
        String mdeliveryname = rs.getString("delname");
        int mdeliveryid = rs.getInt("deliveryid");
        deliveries.add(new Delivery(mprovince,mcity,marea,mdetail,mphone,mdeliveryname,mdeliveryid));
    }
    stat.close();
    conn.close();
%>
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //font-awesome icons -->
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            document.getElementsByClassName("glyphicon glyphicon-shopping-cart my-cart-icon")[0].style.display = "none";
        }
        var deliveryid=parseInt("<%=deliveryid%>");
        function deliveryconfirm () {
        <%
        	if(province == null){
        		%>
        		alert("请先手动添加地址！");
        		<%
        	}
        	else{
        %>
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("post","purchase.jsp","true");
            xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
            xmlhttp.onreadystatechange = function () {
                if(xmlhttp.readyState == 4){
                    if(xmlhttp.responseText.trim().length == 1){
                        /*******************订单生成成功！*************************/
                        /********************清除购物车进入订单页面**********************/
                            localStorage.clear();
                            alert("付款成功！");
                            location.href = "index.jsp";
                    }
                    else {
                        alert(xmlhttp.responseText.trim());
                    }
                }
            }
            xmlhttp.send("deliveryId="+encodeURIComponent(deliveryid)+"&str="+encodeURIComponent("<%=str%>")+"&totalPrice="+encodeURIComponent("<%=deliveryPrice%>")+"&orderingId="+encodeURIComponent("<%=ordering.getOrderingId()%>")+"&userid="+encodeURIComponent("<%=userid%>"));
            <%
            	}
            %>
        };
        function deliveryback() {
            history.go(-1);
        };
        function deliverymore() {
          document.getElementById("none-li").style.display = "inherit";
        }
        function chosedelivery( node) {
            var id = node.id.substring(9,node.id.length);
            id = parseInt(id);
            deliveryid = id ;
            var before = document.getElementsByClassName("delivery-li active")[0];
            before.className = "delivery-li";
            node.className = "delivery-li active";
        }

    </script>
    <title>订单页面</title>
    <style type="text/css">
        #content
        {
            width: 100%;
            background: #fff;
            padding: 30px 0;
            padding-bottom: 150px;
        }

        #purchase-title
        {
            display: inline-block;
            color: #FF7256;
            font-size: 40px;
            font-weight: bold;
            letter-spacing: 10px;
            margin: 30px 150px;
        }
        #ordering
        {
            min-height: 300px;
            max-width: 960px;
            margin: 0px auto;
        }
        #title
        {
            display: block;
            color: #f00;
        }
        #deliver{
            min-height: 50px;
            display: block;
            align-content: right;
            border: 1px solid #03a9f4;
            text-align: right;
            padding: 10px;
        }
        #goods-list li{
            width: 100%;
            height: 50px;
            background: #ccc;
            border-bottom: 1px #03a9f4 solid;
        }
        .name,.sub,.add,.price,.quantity,.totalprice
        {
            float: left;
            padding: 5px 10px;
        }
        #delivery
        {
            width: 100%;
            margin-bottom: 30px;
        }
        #delivery-title,#address-title
        {
            display: block;
            font-size: 18px;
            color: #333;
            letter-spacing: 2px;
            font-weight: 800;
            margin: 5px 10px;
        }
        #address-title
        {
            padding-bottom: 20px;
        }

        #delivery-ul
        {
            list-style: none;
        }
        #control
        {
            display: block;
            height: 30px;
        }
        #delivery-more
        {
            float: left;
            display: inline-block;
            color:#FF7256;
            cursor: pointer;
            padding-top: 10px;
            font-size: 16px;
            padding-left: 13px;
        }
        #delivery-more:hover
        {
            color: #f00;
        }
        #delivery-manage
        {
            display: inline-block;
            float: right;
            font-size: 16px;
        }
        #delivery-manage a
        {
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
            color: #FF7256;
            float: right;
            padding-top: 10px;
            margin-right: 20px;
        }
        #delivery-manage a:hover
        {
            color: #f00;
        }

        .delivery-li{
            cursor: pointer;
            font-size: 12px;
            display: inline-block;
            margin: 10px;
            height: 90px;
            width: 210px;
            overflow:auto;
            border: 4px dashed #737373;
            padding: 11px 15px;
        }
        .delivery-li:hover
        {
            border: 4px dashed #FF7256;
        }
        .active{
            border: 4px dashed #FF7256;
        }
        .part1
        {
            display: block;
            padding-bottom: 5px;
            border-bottom: 1px solid #222;
            overflow: auto;
        }
        .part2
        {
            margin-top: 5px;
        }

        .good
        {
            margin-top: 30px;
            width: 100%;
            padding-top: 15px;
            height: 150px;
            border-top: 1px dotted #03a9f4;
            border-bottom: 1px dotted #03a9f4;
            background: #fbfcff;
        }
        .good-name
        {
            font-size: 16px;
            display: inline-block;
            width: 20%;
            padding-left: 10px;
        }
        .good-price
        {
            font-size: 16px;
            display: inline-block;
            width: 20%;
            text-align: center;
        }
        .good-quantity
        {
            font-size: 16px;
            display: inline-block;
            width: 20%;
            text-align: center;
        }
        .good-totalprice
        {
            font-size: 16px;
            display: inline-block;
            width: 18%;
            text-align: right;
            padding-right: 10px;
            color: #ee0000;
        }
        #delivery-back
        {
            float: right;
            font-size: 14px;
            color: #03a9f4;
            padding-right: 15px;
            padding-top: 18px;
            display: inline-block;
            text-align: center;
        }
        #delivery-back:hover
        {
            cursor: pointer;
            color: #f00;

        }
        #delivery-confirm
        {
            display: inline-block;
            background: #d00;
            float: right;
            color: #fff;
            font-size: 17px;
            padding: 10px 50px;
            text-align: center;
        }
        #delivery-confirm:hover
        {
            cursor: pointer;
        }
        #pay-price
        {
            display: block;
            text-align: right;
            font-size: 14px;
            padding: 30px 5px;
        }
        #pay-price span
        {
            font-size: 25px;
            color: #e00;
            font-weight: bold;
        }
        #adress-tr td
        {
            font-size: 16px;
            color: #333;
            letter-spacing: 2px;
            padding-bottom: 20px;
        }
        .good-picture{
        	width:20%;
        	height:110px;
        	padding-left:10px;
        
        }
    </style>
</head>
<body>
<!-- header -->

<!-- script-for sticky-nav -->
<script>
    $(document).ready(function() {
        var navoffeset=$(".agileits_header").offset().top;
        $(window).scroll(function(){
            var scrollpos=$(window).scrollTop();
            if(scrollpos >=navoffeset){
                $(".agileits_header").addClass("fixed");
            }else{
                $(".agileits_header").removeClass("fixed");
            }
        });

    });
</script>
<!-- //script-for sticky-nav -->
<div class="logo_products" style="border-bottom: 1px solid #999">
    <div class="container">
        <div class="w3ls_logo_products_left">
            <h1><a href="index.jsp"><span>Grocery</span> Store</a></h1>
        </div>
          <p id="purchase-title">付款中心</p>
        <div class="clearfix"> </div>
    </div>
</div>
<!-- //header -->

<div id="content">
<div id="ordering">
    <div id="delivery">
        <div id="delivery-title">选择收货地址</div>

        <ul id="delivery-ul">
            <%
                if(province != null){
            %>
            <li class="delivery-li active" id="delivery-<%=deliveryid%>" onclick="chosedelivery(this)">
                <div class="part1"><%=province%><%=city%>（<%=deliveryname%>）收货</div>
                <div class="part2"><%=area%> <%=detail%>  <%=phone%></div>
            </li>
            <%
            }
            else{
            %>
            <p style="margin-left:15px;color:#f00;margin-bottom:50px;">您还没有设置收货地址，请点击下方管理收货地址添加地址</p>
            <%
                }
                for(int i=0;i<3&&i<deliveries.size();i++){
                    %>
                <li class="delivery-li" id="delivery-<%=deliveries.get(i).deliveryid%>" onclick="chosedelivery(this)">
                    <div class="part1"><%=deliveries.get(i).province%><%=deliveries.get(i).city%>（<%=deliveries.get(i).deliveryname%>）收货</div>
                    <div class="part2"><%=deliveries.get(i).area%> <%=deliveries.get(i).detail%>  <%=deliveries.get(i).phone%></div>
                </li>
            <%
                }
            %>
<div id="none-li" style="display: none">
    <%
        if(deliveries.size()>3){
        for(int i=3;i<deliveries.size();i++){
        %>
        <li class="delivery-li" id="delivery-<%=deliveries.get(i).deliveryid%>" onclick="chosedelivery(this)">
            <div class="part1"><%=deliveries.get(i).province%><%=deliveries.get(i).city%>（<%=deliveries.get(i).deliveryname%>）收货</div>
            <div class="part2"><%=deliveries.get(i).area%> <%=deliveries.get(i).detail%>  <%=deliveries.get(i).phone%></div>
        </li>
        <%
        }
        }
    %>
</div>

        </ul>
        <div id="control">
           <div id="delivery-more" onclick="deliverymore()">显示全部地址</div>
        <div id="delivery-manage"><a href="userInfo.jsp">管理收货地址</a></div>
        </div>
        <div style="float: none"></div>
    </div>


    <div id="address">
        <div id="address-title">确认订单信息</div>
        <table style="width: 100%">
            <tr id="adress-tr" style="text-align: center;color: #333;font-size: 14px;margin-top: 10px;width: 100%;border-bottom: 3px solid #b2d1ff;padding-bottom: 25px;">
                <td style="width: 40%;">商品名称</td>
                <td style="width: 20%">单价</td>
                <td style="width: 20%">数量</td>
                <td style="width: 20%">小计</td>
            </tr>
        </table>

        <%
            for(int i = 0;i<ordering.getProducts().size();i++){
                Product product = ordering.getProducts().get(i);
        %>
        <div class="good" id="product<%=product.id%>">
           <img alt="" src="<%=product.img%>" class="good-picture">
            <div class="good-name"><%=product.name%></div>
            <div class="good-price"><%=product.price%></div>
            <div class="good-quantity"><%=product.quantity%></div>
            <div class="good-totalprice"><%=product.totalPrice%></div>
        </div>

        <%

            }
        %>
        <div id="delivery-foot">
            <div id="pay-price">实付款 <span>￥<%=deliveryPrice%></span></div>
        </div>

        <div id="delivery-confirm" onclick="deliveryconfirm()">提交订单</div>
        <div id="delivery-back" onclick="deliveryback()">返回</div>
    </div>


</div>
</div>

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
