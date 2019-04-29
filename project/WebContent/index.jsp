<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<%!
	User user=null;
%>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="images/sun.png" alt="天气" /></span>
    <%
    	user=(User)session.getAttribute("user");
    	if(user==null){
    		response.sendRedirect("/project/login.jsp");
			return;
    	}
    	out.write("<b>"+user.getUname()+"早上好，欢迎使用机票管理系统</b>");
    %>
    
    <a href="/project/fixPassWord.jsp">修改密码</a>
    </div>
    
    <div class="xline"></div>
    
    <ul class="iconlist">
    <li><a href="flights.jsp" target="rightFrame"><img src="images/ico03.png" /><p>机票信息</p></a></li>
    <li><a href="flightsCollection.jsp" target="rightFrame"><img src="images/ico05.png" /><p>我的收藏</p></a></li>
    <li><a href="tech.html" target="rightFrame"><img src="images/ico01.png" /><p>开发小组</p></a></li>        
    </ul>
    
    
    
    </div>
    
    

</body>

</html>
