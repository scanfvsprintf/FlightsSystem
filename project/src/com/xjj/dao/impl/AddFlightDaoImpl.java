package com.xjj.dao.impl;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.xjj.pojo.*;
public class AddFlightDaoImpl {
	public void addFlight(String start, String end, Timestamp takeoff, Timestamp land, double price, String name) {
		Connection con=null;
		PreparedStatement ps=null;
		List<Flight> flights=null;
		String sql="insert into flight(start,end,takeoff,land,price,name) values (?,?,?,?,?,?)";
		flights=new ArrayList<Flight>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println(start);
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=GMT","root","xyx123");
			ps=con.prepareStatement(sql);
			ps.setString(1, start);
			ps.setString(2, end);
			ps.setTimestamp(3, takeoff);
			ps.setTimestamp(4, land);
			ps.setDouble(5, price);
			ps.setString(6, name);
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
