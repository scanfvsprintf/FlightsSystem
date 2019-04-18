<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
	</head>
	<body>
		<div id="head">
			<img src="img/title.png"/>
		</div>
		<div id="body">
			
			<form action="/project/user" method="POST">
			<%
				if(session.getAttribute("RegisterFail")!=null){
					%><b id="wrong">注册失败！该用户名已被注册！</b><br /><%
				}
			%>
				<input type="hidden" name="type" value="register"/>
				用户名：<input type="text" name="uname" id="uname"/><br />
				密码&nbsp;&nbsp;&nbsp;：<input type="password" name="pwd" id="pwd"/><br />
				<input type="submit" value="注册" id="submit"/><br />
				<a href="/project/login.jsp">已有账户？请登录</a>
			</form>
		
		</div>
	</body>
</html>