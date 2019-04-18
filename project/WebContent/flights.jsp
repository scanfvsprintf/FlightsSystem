<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
<%! 
	String start="%";
	String end="%";
	List<Flight> flights=null;
	Timestamp takeoff=new Timestamp(0);
	Timestamp land=new Timestamp(System.currentTimeMillis()*2);
	double maxPrice=99999999.99;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/flights.css"/>
</head>
<body>
	<div id="div1">
		<div id="flights">
			<%
				start="%";
				end="%";
				takeoff=new Timestamp(0);
				land=new Timestamp(System.currentTimeMillis()*2);
				maxPrice=99999999.99;
				if(request.getParameter("start")!=null && !(request.getParameter("start").equals(""))){
					start=new String(request.getParameter("start").getBytes("ISO-8859-1"),"utf-8");
				}
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				if(request.getParameter("end")!=null  && !(request.getParameter("end").equals(""))){
					end=new String(request.getParameter("end").getBytes("ISO-8859-1"),"utf-8");
				}
				/*
				if(request.getParameter("takeoff")!=null  && !(request.getParameter("takeoff").equals(""))){
					takeoff=request.getParameter("takeoff");
				}
				if(request.getParameter("land")!=null  && !(request.getParameter("land").equals(""))){
					land=request.getParameter("land");
				}
				*/
				if(request.getParameter("maxPrice")!=null  && !(request.getParameter("maxPrice").equals(""))){
					maxPrice=Double.valueOf(request.getParameter("maxPrice"));
				}
				flights=(new AllFlightServiceImpl()).getFlights(start,end,takeoff,land,maxPrice);
				out.write("<table border=\"1\">");
				out.write("<tr><td>"+"机票号"+"</td><td>"+"起飞点"+"</td><td>"+"降落点"+"</td><td>"+"起飞时间"+"</td><td>"+"降落时间"+"</td><td>"+"价格"+"</td><td>"+"收藏"+"</td></tr>");
				if(flights!=null){
					for(Flight each:flights){
						out.write("<tr><td>"+each.getTid()+"</td><td>"+each.getStart()+"</td><td>"+each.getEnd()+"</td><td>"+each.getTakeoff()+"</td><td>"+each.getLand()+"</td><td>"+each.getPrice()+"</td><td>"+"<a href=\"\">收藏</a>"+"</td></tr>");
					}
				}
				
				out.write("</table>");
			%>
		</div>
		<div id="selects">
		<hr/>
			<p>筛选：（若空则表示无限制）</p>
			<form action="/project/flights.jsp" method="POST">
				起飞地：<input type="text" name="start"/><br/>
				降落地：<input type="text" name="end"/><br/>
				最高价：<input type="text" name="maxPrice"/><br/>
				<input type="submit" value="查询"/>
			</form>
		</div>
	</div>
</body>
</html>