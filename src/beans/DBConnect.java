package beans;
import java.sql.*;
import java.util.*;

public class DBConnect {
	//定义数据库所需的成员属性
	private Connection conn =null;	
	
	private static String DBDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//构造函数，调用Class的forname函数
	public DBConnect(){
		try {
			Class.forName(DBDriver).newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			System.out.println("error occur @DBConnection() with InstantiationException");
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			System.out.println("error occur @DBConnection() with IllegalAccessException");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("error occur @DBConnection() with ClassNotFoundException");
			e.printStackTrace();
		}
	}
	
	//获得数据连接的方法
	public Connection getConnection(String user,String password,String databasename){
		String url="jdbc:sqlserver://localhost:1433;DatabaseName="+databasename;
		try {
			conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
}
