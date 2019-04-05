package com.xjj.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.xjj.dao.FlightDao;
import com.xjj.dao.UserDao;
import com.xjj.dao.impl.AllFlightDaoImpl;
import com.xjj.pojo.Flight;
import com.xjj.pojo.User;
import com.xjj.service.FlightService;
import com.xjj.service.UserService;

public class AllFlightServiceImpl implements FlightService {
	@Override
	public List<Flight> getFlights(String start,String end,Timestamp takeoff,Timestamp land,double price) {
		FlightDao fd=new AllFlightDaoImpl();
		List<Flight> flights=fd.getFlights(start,end, takeoff, land, price);
		return flights;
	}

	

}
