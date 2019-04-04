package com.xjj.service;

import java.util.List;

import com.xjj.pojo.Flight;

public interface FlightService {
	public List<Flight> getFlights(String start,String end);
}
