package service;

import object.Goods;
import database.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class GoodsDao{
	public boolean addGoods(Goods goods) throws Exception{
		DBConnection myDbConnect=new DBConnection();
		Connection connection=myDbConnect.getConnection();
		String sql="insert into Goods(categoryid,goodsname,preprice,nowprice,pepertory,sale,praisegrade,describe,picture) values(?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement pstmtPreparedStatement=connection.prepareStatement(sql);
			pstmtPreparedStatement.setInt(1, goods.getCategoryid());
			pstmtPreparedStatement.setString(2, goods.getGoodsname());
			pstmtPreparedStatement.setFloat(3, goods.getPreprice());
			pstmtPreparedStatement.setFloat(4, goods.getNowprice());
			pstmtPreparedStatement.setInt(5, goods.getPepertory());
			pstmtPreparedStatement.setInt(6, goods.getSale());
			pstmtPreparedStatement.setFloat(7, goods.getPraisegrade());
			pstmtPreparedStatement.setString(8, goods.getDescribe());
			pstmtPreparedStatement.setString(9, goods.getPicture());
			pstmtPreparedStatement.execute();
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean deleteGoods(Goods goods) throws Exception{
		DBConnection myDbConnect=new DBConnection();
		Connection conn=myDbConnect.getConnection();
		goods.setDisplay(0);
	  	String sql="update Goods set display='"+goods.getDisplay()+"' where goodsid='"+goods.getGoodsid()+"'";
	  	PreparedStatement pstmt=conn.prepareStatement(sql);
	  	pstmt.executeUpdate();
	  	if(pstmt.executeUpdate()>0){
	  		return true;
	  	}
	  	return false;
	}
	public List<Goods> selectGoods() throws Exception{
		List<Goods> list = new ArrayList<Goods>();
		DBConnection myDbConnect=new DBConnection();
		Connection conn=myDbConnect.getConnection();
		String sql="select * from Goods where display=1";
		
		Statement pstmt=conn.createStatement();
		ResultSet rs=pstmt.executeQuery(sql);
		int i=0;
		while(rs.next()){
			Goods goods=new Goods();
			goods.setGoodsid(rs.getInt("goodsid"));
			goods.setCategoryid(rs.getInt("categoryid"));
			goods.setGoodsname(rs.getString("goodsname"));
			goods.setNowprice(rs.getFloat("nowprice"));
			goods.setPreprice(rs.getFloat("preprice"));
			goods.setPepertory(rs.getInt("pepertory"));
			goods.setSale(rs.getInt("sale"));
			goods.setPraisegrade(rs.getFloat("praisegrade"));
			goods.setDescribe(rs.getString("describe"));
			goods.setDisplay(rs.getInt("display"));
			goods.setPicture(rs.getString("picture"));
			goods.setPraisenum(rs.getInt("praisenum"));
			list.add(i,goods);
			i++;
		}
		return list;
	}
	public List<Goods> selectKind(int categoryid) throws Exception{
		List<Goods> list = new ArrayList<Goods>();
		DBConnection myDbConnect=new DBConnection();
		Connection conn=myDbConnect.getConnection();
		String sql="select * from Goods where categoryid='"+categoryid+"' and display='"+1+"'";
		Statement pstmt=conn.createStatement();
		ResultSet rs=pstmt.executeQuery(sql);
		int i=0;
		while(rs.next()){
			Goods goods=new Goods();
			goods.setGoodsid(rs.getInt("goodsid"));
			goods.setCategoryid(rs.getInt("categoryid"));
			goods.setGoodsname(rs.getString("goodsname"));
			goods.setNowprice(rs.getFloat("nowprice"));
			goods.setPreprice(rs.getFloat("preprice"));
			goods.setPepertory(rs.getInt("pepertory"));
			goods.setSale(rs.getInt("sale"));
			goods.setPraisegrade(rs.getFloat("praisegrade"));
			goods.setDescribe(rs.getString("describe"));
			goods.setDisplay(rs.getInt("display"));
			goods.setPicture(rs.getString("picture"));
			goods.setPraisenum(rs.getInt("praisenum"));
			list.add(i,goods);
			i++;
		}
		return list;
	}
	public boolean updateGoods(Goods goods) throws SQLException {
		DBConnection myDbConnect=new DBConnection();
		Connection connection=myDbConnect.getConnection();
		String sql="update Goods set goodsname='"+goods.getGoodsname()+"', "
				+ "preprice='"+goods.getPreprice()+"',nowprice='"+goods.getNowprice()+"',"
				+ "pepertory='"+goods.getPepertory()+"',sale='"+goods.getSale()+"',"
				+ "describe='"+goods.getDescribe()+"',picture='"+goods.getPicture()+"',"
						+ "categoryid='"+goods.getCategoryid()+"' where goodsid='"+goods.getGoodsid()+"'";
		Statement stmt = connection.createStatement();
		System.out.println(goods.getGoodsname());
		System.out.println(goods.getCategoryid());
		System.out.println(goods.getPreprice());
		System.out.println(goods.getNowprice());
		System.out.println(goods.getDescribe());
		System.out.println(goods.getPepertory());
		System.out.println(goods.getSale());
		System.out.println(goods.getPicture());
		System.out.println(goods.getGoodsid());
		stmt.executeUpdate(sql);
		//PreparedStatement pstmt=connection.prepareStatement(sql);
		if(stmt.executeUpdate(sql)>0){
			return true;
		}
		return false;
	}
}
