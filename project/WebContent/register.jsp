<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
</head>
<body>
	<t1>欢迎注册本系统</t1>
	<%
		if(session.getAttribute("RegisterFail")!=null){
			out.write("<p>注册失败，可能用户名已存在</p>");
		}
	%>
	<form action="/project/user" method="POST">
		<input type="hidden" name="type" value="register"/>
		用户名：<input type="text" name="uname"/>
		密码：<input type="password" name="pwd"/>
		<input type="submit" value="注册"/>
	</form>
	<a href="/project/login.jsp">返回</a>
</body>
</html>