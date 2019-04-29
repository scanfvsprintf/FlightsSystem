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
    <li><a href="#">添加机票</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="/project/addFlight" method="post" target="rightFrame">
    <ul class="forminfo">
    <li><label>航班名</label><input name="" type="text" class="dfinput" /></li>
    <li><label>起飞地</label><input name="" type="text" class="dfinput" /></li>
    <li><label>降落地</label><input name="" type="text" class="dfinput" /></li>
    <li><label>起飞时间</label><input name="" type="text" class="dfinput" /><i>时间格式必须为yyyy-mm-dd hh:mm:ss</i></li>
    <li><label>降落时间</label><input name="" type="text" class="dfinput" /><i>例如：2011-05-09 11:49:45</i></li>
    <li><label>票价</label><input name="" type="text" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn1" value="确认添加"/></li>
    </ul>
    </form>
    
    </div>


</body>

</html>
