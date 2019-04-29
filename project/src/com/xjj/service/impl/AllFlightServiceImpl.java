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
	int length;
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
			result=getFlights(start,end, takeoff, land, price);
		}
		int s=(page-1)*items;
		int e=(page)*items;
		if(s>=length) {
			s=length-1;
			if(s<0) {
				s=0;
			}
		}
		if(e>=length) {
			e=length;
		}
		return result.subList(s, e);
	}
	public int getMaxPage(String start,String end,Timestamp takeoff,Timestamp land,double price) {
		result=getFlights(start,end, takeoff, land, price);
		maxPage=length/items;
		if(length%items!=0) {
			maxPage++;
		}
		return maxPage;
	}
	public int getMaxItem(String start,String end,Timestamp takeoff,Timestamp land,double price) {
		result=getFlights(start,end, takeoff, land, price);
		return length;
	}
	
	

}
