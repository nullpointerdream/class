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
	<script type="text/javascript" src="<%=basePath%>/js/bootstrap-datetimepicker.min.js"></script>
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
					<div class="update-title"><h2>缴费</h2></div>

					<form id="myform" action="<%=basePath%>/user/addMoney" method="get" >

						<div class="form-group">
							<label>学号：</label>
							<input class="form-control" type="text" name="stuid" value="${ sessionScope.user.stuId }" placeholder="学号">
						</div>
						<div class="form-group">
							<label>姓名：</label>
							<input class="form-control" type="text" name="stuname" value="${ sessionScope.user.stuName }" placeholder="姓名">
						</div>
						<div class="form-group">
							<label>缴费金额：</label>
							<input class="form-control" type="text" name="monry"  placeholder="缴费金额">
						</div>
						<div class="form-group">
							<label>备注：</label>
							<input class="form-control" type="text" name="remark"  placeholder="备注">
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

</script>
</html>