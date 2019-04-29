package com.xjj.service.impl;
import java.sql.Timestamp;
import com.xjj.dao.impl.*;
public class AddFlightServiceImpl {
	public void addFlight(String start, String end, String takeoff, String land, String price, String name) {
		//new AddFlightDaoImpl().addFlight(start, end, takeoff, land, price, name);
		Timestamp takeoffT=Timestamp.valueOf(takeoff);
		Timestamp landT=Timestamp.valueOf(land);
		double priceT=Double.valueOf(price);
		new AddFlightDaoImpl().addFlight(start, end, takeoffT, landT, priceT, name);
	}
}
