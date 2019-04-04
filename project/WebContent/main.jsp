<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.pojo.User"%>
<%! 
	User user=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		user=(User)session.getAttribute("user");
		if(user!=null){
			out.write("<t1>欢迎"+user.getUname()+"</t1>");
		}
	%>
</body>
</html>