<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<%!
			User user=null;
%>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>机票管理系统</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        
        <li>
            <div class="header">
            <cite></cite>
            <a href="index.jsp" target="rightFrame">个人中心</a>
            <i></i>
            </div>
            <ul class="sub-menus">
            <li><a href="/project/fixPassWord.jsp" target="rightFrame">修改密码</a></li>
            <li><a href="/project/login.jsp" target="_top">退出登录</a></li>
            </ul>
        </li>
        
        <li>
            <div class="header">
            <cite></cite>
            <a href="javascript:;" target="rightFrame">机票管理</a>
            <i></i>
            </div>                
            <ul class="sub-menus">
            <li><a href="flights.jsp" target="rightFrame">机票查询</a></li>
            <li><a href="flightsCollection.jsp" target="rightFrame">我的收藏</a></li>
            <li><a href="graphic.jsp" target="rightFrame">统计图表</a></li>
            </ul>
        </li>
        <%
					user=(User)session.getAttribute("user");
					if(user==null){
						response.sendRedirect("/project/login.jsp");
						return;
					}
					if(user.getUname().equals("admin")){
						%>
					
        <li>
            <div class="header">
            <cite></cite>
            <a href="javascript:;" target="rightFrame">管理员选项</a>
            <i></i>
            </div>                
            <ul class="sub-menus">
            <li><a href="addFlight.jsp" target="rightFrame">添加机票</a></li>
            </ul>
        </li>
			<%}
		%>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>关于
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="tech.html" target="rightFrame">项目小组</a><i></i></li>
        </ul>     
    </dd> 
    
    </dl>
    
</body>
</html>
