<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>首页</title>
	<script src="<%=basePath%>/js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/jquery.bootgrid.min.css">
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>/js/jquery.bootgrid.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/bootstrap-datepicker.js"></script>
	<script src="<%=basePath%>/js/bootstrap-datepicker.zh-CN.js"></script>
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
</head>
<body>

<!-- 导航条+表格显示 -->
<div class="container-fluid">
	<!-- 搭建展示页面 -->
	<div id="container-fluid">
		<!--表格-->
		<div class="col-md-9">
			<!-- fade淡入淡出效果,in默认显示 -->
			<div class="tab-pane active fade in" id="myInfo">
				<div class="update-box">

					<form id="myform" action="<%=basePath%>/user/submitLeave" method="post" >
						<input type="hidden" name="userid" value="${ sessionScope.user.id }">

						<div class="form-group">
							<label>学号：</label>
							<input class="form-control" type="text" name="stuid" value="${ sessionScope.user.stuId }" readonly placeholder="学号">
						</div>
						<div class="form-group">
							<label>姓名：</label>
							<input class="form-control" type="text" name="stuname" value="${ sessionScope.user.stuName }" readonly placeholder="姓名">
						</div>
						<div class="form-group">
							<label>离校原因：</label>
							<input class="form-control" type="text" name="stureson"  placeholder="离校原因">
						</div>
						<div class="form-group">
							<label>回家地址/出游地址：</label>
							<input class="form-control" type="text" name="sturaddr"  placeholder="回家地址/出游地址">
						</div>
						<div class="form-group">
							<label>本人联系方式：</label>
							<input class="form-control" type="text" name="stutel" value="${ sessionScope.user.stuTel }" placeholder="联系方式">
						</div>
						<div class="form-group">
							<label>父母联系方式：</label>
							<input class="form-control" type="text" name="stuparetel"  placeholder="父母联系方式">
						</div>
						<div class="form-group">
							<label>离校具体时间：</label>
							<input class="form-control" id="datetimeStart" type="text" name="starttime"  placeholder="离校时间">
						</div>
						<div class="form-group">
							<label>返校具体时间：</label>
							<input class="form-control" id="datetimeEnd" type="text" name="returntel"  placeholder="返校时间">
						</div>
						<input class="btn btn-primary form-control" type="submit" id="submit" value="提  交">
					</form>
				</div>
			</div>


		</div>
	</div>
</div>



</body>
<script type="text/javascript">

    $("#select").click(function(){
        $("#upload").trigger("click");

    });
    $("#submit").on("click",function(){
        form.submit();
    });

    $('#datetimeStart').datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
    })
    $('#datetimeEnd').datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
    })
</script>
</html>