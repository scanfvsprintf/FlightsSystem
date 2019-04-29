package com.xjj.dao.impl;
import java.sql.*;
import com.xjj.dao.UserDao;
import com.xjj.pojo.User;

public class FixPassWordDaoImpl {

	public void checkUser(User u) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		String sql="update users set pwd=? where uname=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=GMT","root","xyx123");
			ps=con.prepareStatement(sql);
			ps.setString(1, u.getPwd());
			ps.setString(2, u.getUname());
			ps.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
