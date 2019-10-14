<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/menu.css"/>
		<%!
			User user=null;
		%>
	</head>
	<body>
		<div id="menu">
			<ul>
				<li><a href="flights.jsp" target="frame_main"><input type="button" name="buttons" id="buttons" value="首页" /></a></li>
				<li><a href="flights.jsp" target="frame_main"><input type="button" name="buttons" id="buttons" value="浏览机票" /></a></li>
				<li><a href="flights.jsp" target="frame_main"><input type="button" name="buttons" id="buttons" value="个人收藏" /></a></li>
				<li><a href="flights.jsp" target="frame_main"><input type="button" name="buttons" id="buttons" value="关于" /></a></li>
				<%
					user=(User)session.getAttribute("user");
					if(user==null){
						response.sendRedirect("/project/login.jsp");
						return;
					}
					if(user.getUname().equals("admin")){
						%><li><a href="addFlight.html" target="frame_main"><input type="button" name="buttons" id="buttons" value="添加机票" /></a></li><%
					}
				%>
			</ul>
		</div>
		
		
	</body>
</html>
