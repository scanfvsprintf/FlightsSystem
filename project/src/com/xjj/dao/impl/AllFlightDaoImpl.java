package com.xjj.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.xjj.dao.FlightDao;
import com.xjj.pojo.Flight;
import com.xjj.pojo.User;

public class AllFlightDaoImpl implements FlightDao{

	@Override
	public List<Flight> getFlights(String start,String end,Timestamp takeoff,Timestamp land,double price) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		List<Flight> flights=null;
		ResultSet rs=null;
		String sql="select * from flight where start like ? and end like ? and takeoff>? and land<? and price<?";
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
			rs=ps.executeQuery();
			while(rs.next()) {
				System.out.println("suc!");
				flights.add(new Flight(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getTimestamp(4),rs.getTimestamp(5),rs.getDouble(6)));
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
