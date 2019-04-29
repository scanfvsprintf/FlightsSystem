package com.xjj.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.xjj.pojo.Flight;

public class CollectFlightDaoImpl {
	public void collect(int uid,int tid) {
		Connection con=null;
		PreparedStatement ps=null;
		List<Flight> flights=null;
		ResultSet rs=null;
		String sql="select * from collection where uid=? and tid=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=GMT","root","xyx123");
			ps=con.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, tid);
			rs=ps.executeQuery();
			if(!rs.next()) {
				ps.close();
				sql="insert into collection(uid,tid) values (?,?)";
				ps=con.prepareStatement(sql);
				ps.setInt(1, uid);
				ps.setInt(2, tid);
				ps.execute();
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
	}
}
