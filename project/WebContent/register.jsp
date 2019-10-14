<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    <form action="/project/user" method="POST">
    	<input type="hidden" name="type" value="register"/>
    	
	    <ul>
	    <%
				if(session.getAttribute("RegisterFail")!=null){
					%><li><b id="wrong">注册失败！该用户名已被注册，或不合法的用户名及密码！</b></li><%
				}
		%>
	    <li><input name="uname" type="text" class="loginuser" value="" onclick="JavaScript:this.value=''"/></li>
	    <li><input name="pwd" type="text" class="loginpwd" value="" onclick="JavaScript:this.value=''"/></li>
	    <li><input name="" type="submit" class="loginbtn" value="注册"  onclick=""  />&nbsp&nbsp<a href="login.jsp"><input name="" type="button" class="loginbtn" value="返回登录"  onclick=""  /></a></li>
	    </ul>
    </form>
    
    </div>
    
    </div>
    
    
    
	
    
</body>

</html>
