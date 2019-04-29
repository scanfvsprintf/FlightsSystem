package com.xjj.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.xjj.pojo.Flight;

public class GetCollectFlightDaoImpl {
	public List<Flight> getFlights(int uid,String start,String end,Timestamp takeoff,Timestamp land,double price) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement ps=null;
		List<Flight> flights=null;
		ResultSet rs=null;
		System.out.println("uid:"+uid);
		String sql="select flight.tid,flight.start,flight.end,flight.takeoff,flight.land,flight.price,flight.name  from collection join flight on collection.tid=flight.tid where start like ? and end like ? and takeoff>? and land<? and price<? and uid=?";
		flights=new ArrayList<Flight>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=GMT","root","xyx123");
			ps=con.prepareStatement(sql);
			ps.setString(1, start);
			ps.setString(2, end);
			ps.setTimestamp(3, takeoff);
			ps.setTimestamp(4, land);
			ps.setDouble(5, price);
			ps.setInt(6, uid);
			rs=ps.executeQuery();
			while(rs.next()) {
				System.out.println("suc!");
				flights.add(new Flight(rs.getInt("tid"),rs.getString("start"),rs.getString("end"),rs.getTimestamp("takeoff"),rs.getTimestamp("land"),rs.getDouble("price"),rs.getString("name")));
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
