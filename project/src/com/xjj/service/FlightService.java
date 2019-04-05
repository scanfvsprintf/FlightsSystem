package com.xjj.service;

import java.sql.Timestamp;
import java.util.List;

import com.xjj.pojo.Flight;

public interface FlightService {
	public List<Flight> getFlights(String start,String end,Timestamp takeoff,Timestamp land,double price);
}
