package service;

import object.Categorys;
import database.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao{
	public List<Categorys> getCategory()throws Exception{
		DBConnection myDbConnect=new DBConnection();
		Connection connect=myDbConnect.getConnection();
		String sql="select * from Category";
		List<Categorys> list = new ArrayList<Categorys>();
		Statement pstmt=connect.createStatement();
		ResultSet rs=pstmt.executeQuery(sql);
		int i=0;
		while(rs.next()){
			Categorys categorys=new Categorys();
			categorys.setCategoryname(rs.getString("categoryname"));
			categorys.setCategoryid(rs.getInt("categoryid"));
			list.add(i,categorys);
			i++;
		}
		return list;
	}
}