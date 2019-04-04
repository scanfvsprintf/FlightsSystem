<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登陆</title>
</head>
<body>
	<t1>欢迎使用本系统</t1>
	<%
		if(session.getAttribute("loginFail")!=null){
			out.write("<p>用户名或密码错误，请重新输入</p>");
		}
	%>
	<form action="/project/user" action="POST">
		<input type="hidden" name="type" value=""/>
		用户名：<input type="text" name="uname"/>
		密码：<input type="password" name="pwd"/>
		<input type="submit" value="登陆"/>
	</form>
</body>
</html>