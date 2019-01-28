<%@ page import="java.util.List" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="beans.Ordering" %>
<%@ page import="beans.Product" %>
<%@ page import="beans.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
 	response.setContentType("text/html;charset=utf-8"); 
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
    String str = (String)request.getParameter("str").trim();
    float totalPrice = Float.parseFloat((String)request.getParameter("totalPrice").trim());
    String orderingId = (String)request.getParameter("orderingId").trim();
    int userId = Integer.parseInt((String)request.getParameter("userid").trim());
    String deliveryId = (String) request.getParameter("deliveryId").trim();
    List<String> list=new ArrayList<String>();
    StringTokenizer st=new StringTokenizer(str,"|");
    int j=0;
    while(st.hasMoreTokens()){
        list.add(st.nextToken());
    }
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String time=df.format(new Date()).toString();
    System.out.println(time);
    for(int i = 0;i < list.size()/4;i ++ ){
        int productid = Integer.parseInt(list.get(j));
        int number = Integer.parseInt(list.get(j+3));
        j+=4;
    }
/********************************查询是否可以买********************************/
    String sql = "select account from Users where userid="+userId;
    /****查询余额**********/
    Connection conn = new DBConnect().getConnection("test","123456","shopping");
    Statement stat = conn.createStatement();
    ResultSet rs =  stat.executeQuery(sql);
    int account = 0;
    if( rs.next() ){
        account = rs.getInt("account");
    }
    if(account < totalPrice){
        /**********************余额不足*********************/
        stat.close();
        conn.close();
        response.getWriter().write("余额不足请充值");
        return;
    }
    /*********************查询商品是否可买************************/
    j = 0;
    for(int i = 0;i < list.size()/4;i ++ ){
        int productid = Integer.parseInt(list.get(j));
        String productname = list.get(j+1);
        int quantity = Integer.parseInt(list.get(j+3));
        j+=4;
        sql = "select * from Goods where goodsid="+productid+"  and display = 1";
        rs = stat.executeQuery(sql);
        if(rs.next()){
            int pepertory = rs.getInt("pepertory");
         if(pepertory<quantity) {
             /******************通知某商品超出数量限制********************/
             response.getWriter().write("商品" + productname + "数量超出库存限制！你最多可买"+pepertory+"个");
             stat.close();
             conn.close();
             return;
         }
        }
    }

        sql = "update  users  set account-="+totalPrice+" WHERE userid = "+userId;
        if(stat.executeUpdate(sql)>0){
            /************扣款成功************/

            j = 0;
            for(int i = 0;i < list.size()/4;i ++ ){
                int productid = Integer.parseInt(list.get(j));
                int quantity = Integer.parseInt(list.get(j+3));
                j+=4;
                /************************更新订单******************************/
                sql = "insert into Ordering values('"+orderingId+"',"+userId+","+deliveryId+",'"+time+"',"+productid+","+quantity+",0)";
                stat.executeUpdate(sql);

                /***************************扣库存*****************************/
                sql = "update Goods set sale+="+quantity+", pepertory -="+quantity+" where goodsid="+productid+" and display = 1 ";
                stat.executeUpdate(sql);
            }
        }
        else{
            /*******************扣款失败********************/
            stat.close();
            conn.close();
            response.getWriter().write("扣款失败，请联系管理员！");
            /*************************通知余额不足****************/
            return;
        }
    response.getWriter().write("1");
    stat.close();
    conn.close();
%>
