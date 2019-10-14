<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*,com.xjj.service.*,com.xjj.pojo.*,com.xjj.service.impl.*,java.util.*,java.sql.*"%>
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
    <li><a href="#">统计图表</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    <form action="/project/graphic.jsp" method="POST">
    <ul class="seachform1">
    <li><label>起飞城市</label><input name="start" type="text" class="scinput1" /></li> 
	<li><label>降落城市</label><input name="end" type="text" class="scinput1" /></li> 
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
    
    
    
    <div class="formtitle"><span>统计结果</span></div>
    <%
    	if(request.getParameter("start")!=null && request.getParameter("end")!=null){
    		start=new String(request.getParameter("start").getBytes("ISO-8859-1"),"utf-8");
        	end=new String(request.getParameter("end").getBytes("ISO-8859-1"),"utf-8");
        	String res="images/"+start+"-"+end+"pic.png";
        	File file=new File(request.getRealPath(res));
        	if(!file.exists()){
        		%><p>查询失败，不存在该城市间的机票</p><%
        	}
        	else{
        		out.write("<img src=\""+res+"\" width=\"640px\" height=\"453px\"/>");
        	}
    	}
    	else{
    		%><p>输入城市名以查询统计结果</p><%
    	}
    	
    %>
    
	</div> 
    </div>


</body>

</html>
