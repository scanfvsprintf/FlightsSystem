package com.xjj.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xjj.service.impl.AddFlightServiceImpl;

/**
 * Servlet implementation class AddFlightServlet
 */
@WebServlet("/addFlight")
public class AddFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String start;
	public String end;
	public String takeoff;
	public String land;
	public String price;
	public String name;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		start=request.getParameter("start");
		end=request.getParameter("end");
		takeoff=request.getParameter("takeoff");
		land=request.getParameter("land");
		price=request.getParameter("price");
		name=request.getParameter("name");
		new AddFlightServiceImpl().addFlight(start,end,takeoff,land,price,name);
		response.getWriter().write("Ìí¼Ó³É¹¦");
		
	}

}
