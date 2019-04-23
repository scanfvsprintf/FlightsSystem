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
	List<Flight> result=null;
	int items=10;
	int length=0;
	int maxPage=0;
	@Override
	public List<Flight> getFlights(String start,String end,Timestamp takeoff,Timestamp land,double price) {
		FlightDao fd=new AllFlightDaoImpl();
		List<Flight> flights=fd.getFlights(start,end, takeoff, land, price);
		result=flights;
		length=flights.size();
		return flights;
	}
	public List<Flight> getFlightsByPage(String start,String end,Timestamp takeoff,Timestamp land,double price,int page){
		if(page<0) {
			page=0;
		}
		if(result==null) {
			getFlights(start,end, takeoff, land, price);
		}
		int s=(page-1)*items;
		int e=(page)*items;
		if(s>=length) {
			s=length-1;
		}
		if(e>=length) {
			e=length-1;
		}
		return result.subList(s, e);
	}
	public int getMaxPage() {
		maxPage=length/items;
		if(length%items!=0) {
			maxPage++;
		}
		return maxPage;
	}

	

}
