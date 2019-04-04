<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*"%>
<%! 
	String start="%";
	String end="%";
	List<Flight> flights=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(request.getParameter("start")!=null){
			start=request.getParameter("start");
		}
		if(request.getParameter("end")!=null){
			start=request.getParameter("end");
		}
		flights=(new AllFlightServiceImpl()).getFlights(start,end);
		out.write("<table border=\"1\">");
		out.write("<tr><td>"+"起飞点"+"</td><td>"+"降落点"+"</td><td>"+"起飞时间"+"</td><td>"+"降落时间"+"</td></tr>");
		if(flights!=null){
			for(Flight each:flights){
				out.write("<tr><td>"+each.getStart()+"</td><td>"+each.getEnd()+"</td><td>"+each.getTakeoff()+"</td><td>"+each.getLand()+"</td></tr>");
			}
		}
		
		out.write("</table>");
	%>
</body>
</html>