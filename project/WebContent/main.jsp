<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.pojo.User"%>
<%! 
	User user=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		user=(User)session.getAttribute("user");
		if(user!=null){
			out.write("<t1>欢迎"+user.getUname()+"使用本系统</t1>");
		}
		else{
			response.sendRedirect("/project/login.jsp");
		}
	%>
	<p>请选择您需要的功能：</p>
	<a href="/project/flights.jsp">查询航班信息</a>
	<a href="/project/flights.jsp">管理已收藏的航班信息</a>
</body>
</html>