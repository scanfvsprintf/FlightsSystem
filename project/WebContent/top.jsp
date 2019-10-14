<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<%!
	User user=null;
%>

</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.jsp" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a href="flights.jsp" target="rightFrame" class="selected"><img src="images/icon01.png" title="机票管理" /><h2>机票管理</h2></a></li>
    <li><a href="flightsCollection.jsp" target="rightFrame"><img src="images/icon05.png" title="我的收藏" /><h2>我的收藏</h2></a></li>
    <li><a href="graphic.jsp"  target="rightFrame"><img src="images/icon02.png" title="统计图表" /><h2>统计图表</h2></a></li>
    <li><a href="fixPassWord.jsp"  target="rightFrame"><img src="images/icon06.png" title="修改密码" /><h2>修改密码</h2></a></li>
    <li><a href="tech.html"  target="rightFrame"><img src="images/icon03.png" title="开发人员" /><h2>开发人员</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="login.jsp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <%
    	user=(User)session.getAttribute("user");
    	if(user==null){
    		response.sendRedirect("/project/login.jsp");
			return;
    	}
    	out.write("<span>"+user.getUname()+"</span>");
    %>
    <i>欢迎您</i>
    </div>    
    
    </div>

</body>
</html>
