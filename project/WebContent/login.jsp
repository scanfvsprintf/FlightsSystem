<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登陆</title>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
	</head>
	<body>
		<div id="head">
			<img src="img/title.png"/>
		</div>
		<div id="body">
			
			<form action="/project/user" method="POST">
			<%
				if(session.getAttribute("loginFail")!=null){
					%><b id="wrong">您输入的用户名或密码有误，请重新输入！</b><br /><%
				}
			%>
				<input type="hidden" name="type" value="login"/>
				用户名：<input type="text" name="uname" id="uname"/><br />
				密码&nbsp;&nbsp;&nbsp;：<input type="password" name="pwd" id="pwd"/><br />
				<input type="submit" value="登陆" id="submit"/><br />
				<a href="/project/register.jsp">注册新用户</a>
			</form>
		
		</div>
	</body>
</html>