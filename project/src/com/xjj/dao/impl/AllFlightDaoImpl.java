package com.xjj.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.xjj.dao.FlightDao;
import com.xjj.pojo.Flight;
import com.xjj.pojo.User;

public class AllFlightDaoImpl implements FlightDao{

	@Override
	public List<Flight> getFlights(String start,String end) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		List<Flight> flights=null;
		ResultSet rs=null;
		String sql="select * from flight where start=? and end=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=GMT","root","xyx123");
			ps=con.prepareStatement(sql);
			ps.setString(1, start);
			ps.setString(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {
				System.out.println("suc!");
				flights.add(new Flight(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getTimestamp(4),rs.getTimestamp(5)));
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
		return flights;
	}

}
