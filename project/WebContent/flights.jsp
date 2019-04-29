<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  <script type="text/javascript">
			function gotoPage(page){
				document.getElementById("p").value=page;
				document.getElementById("pages").submit();
			}
			function nextPage(){
				document.getElementById("p").value=document.getElementById("p").value-1+1+1;
				document.getElementById("pages").submit();
			}
			function backPage(){
				var t=document.getElementById("p").value-1;
				if(t<=0){
					t=1;
				}
				document.getElementById("p").value=t;
				document.getElementById("pages").submit();
			}
			function collect(tid){
				var ajax=new XMLHttpRequest();
				var result;
				ajax.open("POST","/project/collect",true);
				ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				ajax.send("type=collect&tid="+tid);
				ajax.onreadystatechange=function(){
					if(ajax.readyState==4){
						result=ajax.responseText;
						alert("收藏成功！");
					}		
				}
			}
</script>
<script type="text/javascript">
$(document).ready(function(e) {

	$(".select3").uedSelect({
		width : 152
	});
});
</script>
<%! 
	String start="%";
	String end="%";
	int pageNo=1;
	List<Flight> flights=null;
	Timestamp takeoff=new Timestamp(0);
	Timestamp land=new Timestamp(System.currentTimeMillis()*2);
	double maxPrice=99999999.99;
	AllFlightServiceImpl result;
	
%>
</head>

<body class="sarchbody">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="/project/index.jsp">首页</a></li>
    <li><a href="#">浏览机票</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    <form action="/project/flights.jsp" method="POST">
    <ul class="seachform1">
    <li><label>起飞地</label><input name="start" type="text" class="scinput1" /></li> 
	<li><label>降落地</label><input name="end" type="text" class="scinput1" /></li> 
	<li><label>最高价</label><input name="maxPrice" type="text" class="scinput1" /></li> 
    </ul>
    <ul class="seachform1">
    <li class="sarchbtn"><label>&nbsp;</label><input name="" type="submit" class="scbtn2" value="查询"/></li>  
    </ul>
    <script language="javascript">
	$(document).ready(function() 
	{ 
	    $(".scbtn1").click(function() 
	    {      
	        if( $(".seachform2").hasClass("hideclass") ) 
	        { 
	            $(".seachform2").removeClass("hideClass"); 
	        } 
	        else 
	        { 
	            $(".seachform2").addClass("hideClass"); 
	        }    
	    }); 
	}); 
	</script>
    <script type="text/javascript">
		$(document).ready(function(){
		  $(".scbtn1").click(function(){
		  $(".seachform2").fadeIn(200);
		  }); 
		
		
		});
	</script>
	</form>
    
    
    
    <div class="formtitle"><span>机票列表</span></div>
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>航班名<i class="sort"><img src="images/px.gif" /></i></th>
        <th>起飞点</th>
        <th>降落点</th>
        <th>起飞时间</th>
        <th>降落时间</th>
        <th>票价</th>
        <th>收藏</th>
        </tr>
        </thead>
        <tbody>
        
        <%
				try{
					pageNo=Integer.valueOf(request.getParameter("page"));
				}
				catch(Exception e){
					pageNo=1;
				}
				start="%";
				end="%";
				takeoff=new Timestamp(0);
				land=new Timestamp(System.currentTimeMillis()*2);
				maxPrice=99999999.99;
				if(request.getParameter("start")!=null && !(request.getParameter("start").equals(""))){
					start=new String(request.getParameter("start").getBytes("ISO-8859-1"),"utf-8");
				}
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				if(request.getParameter("end")!=null  && !(request.getParameter("end").equals(""))){
					end=new String(request.getParameter("end").getBytes("ISO-8859-1"),"utf-8");
				}
				/*
				if(request.getParameter("takeoff")!=null  && !(request.getParameter("takeoff").equals(""))){
					takeoff=request.getParameter("takeoff");
				}
				if(request.getParameter("land")!=null  && !(request.getParameter("land").equals(""))){
					land=request.getParameter("land");
				}
				*/
				if(request.getParameter("maxPrice")!=null  && !(request.getParameter("maxPrice").equals(""))){
					maxPrice=Double.valueOf(request.getParameter("maxPrice"));
				}
				result=new AllFlightServiceImpl();
				flights=result.getFlightsByPage(start,end,takeoff,land,maxPrice,pageNo);
				if(flights!=null){
					for(Flight each:flights){
						out.write("<tr><td>"+each.getName()+"</td><td>"+each.getStart()+"</td><td>"+each.getEnd()+"</td><td>"+each.getTakeoff()+"</td><td>"+each.getLand()+"</td><td>"+each.getPrice()+"</td><td>"+"<a href=\"#\" onclick=\"collect("+each.getTid()+")\">收藏</a>"+"</td></tr>");
					}
				}
				
			%>
        </tbody>
    </table>
    <div class="pagin" >
    	<div class="message">共<i class="blue"><%=result.getMaxItem(start,end,takeoff,land,maxPrice) %></i>条记录，当前显示第&nbsp;<i class="blue"><%=pageNo %>&nbsp;</i>页</div>
        <form action="/project/flights.jsp" method="POST" id="pages">
        <input type="hidden" name="start" value="<%=start%>"/>
		<input type="hidden" name="end" value="<%=end%>"/>
		<input type="hidden" name="maxPrice" value="<%=maxPrice%>"/>
		<input type="hidden" name="page" id="p" value="<%=pageNo%>"/>
        <ul class="paginList">
        <%
	        if(pageNo!=1){
	        	out.write("<li class=\"paginItem\"><a href=\"javascript:; \" onclick=\"backPage()\"><span class=\"pagepre\"></span></a></li>");
	        }
        	int maxpage=result.getMaxPage(start, end, takeoff, land, maxPrice);
       		 int i;
       		 for(i=1;i<=maxpage && i<=5;i++){
       			out.write("<li class=\"paginItem\"><a href=\"javascript:;\" onclick=\"gotoPage("+i+")\">"+i+"</a></li>");
       		 }
        	if(maxpage>=7){
        		out.write("<li class=\"paginItem more\"><a href=\"javascript:;\">...</a></li>");
        	}
        	if(maxpage>=6){
        		out.write("<li class=\"paginItem\"><a href=\"javascript:;\" onclick=\"gotoPage("+maxpage+")\">"+maxpage+"</a></li>");
        	}
        	if(pageNo!=maxpage){
	        	out.write("<li class=\"paginItem\"><a href=\"javascript:; \" onclick=\"nextPage()\"><span class=\"pagenxt\"></span></a></li>");
	        }
        %>
        </ul>
        </form>
    </div>
	</div> 
    </div>


</body>

</html>
