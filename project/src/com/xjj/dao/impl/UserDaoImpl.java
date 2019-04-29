package com.xjj.dao.impl;
import java.sql.*;
import com.xjj.dao.UserDao;
import com.xjj.pojo.User;

public class UserDaoImpl implements UserDao{

	@Override
	public User checkUser(String uname, String pwd) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		User user=null;
		ResultSet rs=null;
		String sql="select * from users where uname like ? and pwd like ?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=GMT","root","xyx123");
			ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			rs=ps.executeQuery();
			while(rs.next()) {
				System.out.println("suc!");
				user=new User(rs.getInt("uid"),rs.getString("uname"),rs.getString("pwd"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}

}
