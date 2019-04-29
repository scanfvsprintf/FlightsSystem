<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="/project/index.jsp">首页</a></li>
    <li><a href="#">修改密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改密码</span></div>
    <form action="/project/user" method="post" target="rightFrame">
    <input type="hidden" name="type" value="fixpassword"/>
    <ul class="forminfo">
    <li><label>修改密码</label><input name="pwd" type="password" class="dfinput" /></li>
    <li><label>确认密码</label><input name="pwd2" type="password" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn1" value="确认修改"/></li>
    </ul>
    </form>
    
    </div>


</body>

</html>
