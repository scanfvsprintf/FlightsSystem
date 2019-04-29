package com.xjj.dao;
import java.sql.Timestamp;
import java.util.List;
import com.xjj.pojo.Flight;
public interface FlightDao {
	public List<Flight> getFlights(String start,String end,Timestamp takeoff,Timestamp land,double price);
}
