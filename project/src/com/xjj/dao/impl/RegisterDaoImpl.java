package com.xjj.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xjj.dao.UserDao;
import com.xjj.pojo.User;

public class RegisterDaoImpl implements UserDao{

	@Override
	public User checkUser(String uname, String pwd) {
		Connection con=null;
		PreparedStatement ps=null;
		User user=null;
		ResultSet rs=null;
		String sql="insert into users(uname,pwd) values (?,?)";
		String sql2="select * from users where uname=? ";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=GMT","root","xyx123");
			ps=con.prepareStatement(sql2);
			ps.setString(1, uname);
			rs=ps.executeQuery();
			if(rs.next()) {
				return null;
			}
			rs.close();
			ps.close();
			ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			ps.execute();
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
		user=new UserDaoImpl().checkUser(uname, pwd);
		return user;
	}

}
