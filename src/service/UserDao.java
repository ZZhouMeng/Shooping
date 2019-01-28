package service;
import object.User;
import database.DBConnection;
import java.sql.*;
import java.util.Vector;

public class UserDao {
	public boolean addUser(User user){
		DBConnection myDB=new DBConnection();
		Connection conn=myDB.getConnection();
		String sql="INSERT INTO Users(username,paswd,email,phone) VALUES (?,?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;	
	}
}
