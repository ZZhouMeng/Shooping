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

<title>check_editDelivery</title>

</head>

<body>
	<%
  	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
   	request.setCharacterEncoding("UTF-8");
   	int userid=0; 
   	if(session.getAttribute("userid")!=null){
   		userid=Integer.parseInt(session.getAttribute("userid").toString());
   	}
   	int deliveryid=Integer.parseInt(request.getParameter("deliveryid").toString());
 	String sel=request.getParameter("sel");
 	String detail=request.getParameter("detail");
 	String delname=request.getParameter("delname");
 	String phone=request.getParameter("phone");
 	String delitype=request.getParameter("delitype");
 	String province,city,area;
 	String[] b = sel.split("-"); 
 	province=b[0];
 	city=b[1];
 	area=b[2];
 	int delitypes;
 	if(delitype==null){
 		delitypes=0;
 	}else{
 		delitypes=1;
 		String SQL="Update Delivery set delitype=0 WHERE userid='"+userid+"'";
		stmt.executeUpdate(SQL);
 	}
 	
 	out.println(province+" "+city+" "+area+" "+detail+" "+delname+" "+phone+" "+delitype);
	String sql="Update Delivery set userid='"+userid+"',province='"+province+"',city='"+city+"',area='"+area+"',detail='"+detail+"',delitype="+delitypes+",phone='"+phone+"',delname='"+delname+"' where deliveryid="+deliveryid+"";
	stmt.executeUpdate(sql);
	response.sendRedirect("userInfo.jsp");
 %>
</body>
</html>
