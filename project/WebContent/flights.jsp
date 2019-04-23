<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
<%! 
	String start="%";
	String end="%";
	int pageNo=1;
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
<script type="text/javascript">
			function firstPage(){
				document.getElementById("p").value=1;
			}
			function nextPage(page){
				document.getElementById("p").value=page+1;
			}
			function backPage(page){
				var t=page-1;
				if(t<=0){
					t=1;
				}
				document.getElementById("p").value=t;
			}
</script>
</head>
<body>
	<div id="div1">
		<div id="flights">
			<%
				try{
					pageNo=Integer.valueOf(request.getParameter("page"));
				}
				catch(Exception e){
					pageNo=1;
				}
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
				flights=(new AllFlightServiceImpl()).getFlightsByPage(start,end,takeoff,land,maxPrice,pageNo);
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
				<hr/>
			</form>
			<form action="/project/flights.jsp" method="POST">
				<input type="hidden" name="start" value="<%=start%>"/>
				<input type="hidden" name="end" value="<%=end%>"/>
				<input type="hidden" name="maxPrice" value="<%=maxPrice%>"/>
				页数：<input type="text" name="page" id="p" value="<%=pageNo%>"/>
				<input type="submit" value="跳转"/>
				<input type="submit" value="上一页" onclick="backPage(<%=pageNo%>)"/>
				<input type="submit" value="下一页" onclick="nextPage(<%=pageNo%>)"/>
				<input type="submit" value="首页" onclick="firstPage()"/>
			</form>
		</div>
	</div>
</body>
</html>