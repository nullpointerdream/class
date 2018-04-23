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
					<div class="update-title">您的信息如下，点击可以编辑</div>
					<div class="content_top">
						<label for="file">头像 :</label>
						<div>
							<div>
								<img id="img" src="<%=basePath%>/images/${ sessionScope.user.img }" class="img-circle" alt="" width=80 height=80>
							</div>

							<div>
								<form >

								</form>
							</div>
						</div>
					</div>
					<form id="myform" action="<%=basePath%>/user/updateUser" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${ sessionScope.user.id }">
						<input type="hidden" name="img" value="${ sessionScope.user.img }">
						<input type="file" name="file" id="upload" style="display:none;"/>
						<button type="button" id="select" class="btn btn-primary">选择头像</button>

						<div class="form-group">
							<label>学号：</label>
							<input class="form-control" type="text" name="stuId" value="${ sessionScope.user.stuId }" placeholder="学号">
						</div>
						<div class="form-group">
							<label>姓名：</label>
							<input class="form-control" type="text" name="stuName" value="${ sessionScope.user.stuName }" placeholder="姓名">
						</div>
						<div class="form-group">
							<label>专业名称：</label>
							<input class="form-control" type="text" name="stuMajor" value="${ sessionScope.user.stuMajor }" placeholder="专业名称">
						</div>
						<div class="form-group">
							<label>联系方式：</label>
							<input class="form-control" type="text" name="stuTel" value="${ sessionScope.user.stuTel }" placeholder="联系方式">
						</div>
						<div class="form-group">
							<label>职位：</label>
							<select class="form-control bbb" name="stuJob" value="${ sessionScope.user.stuJob }" >
								<option value="学生"  <c:if test="${'学生' eq sessionScope.user.stuJob}">selected</c:if>>学生</option>
								<option value="班长" <c:if test="${'班长' eq sessionScope.user.stuJob}">selected</c:if>>班长</option>
								<option value="学习委员"  <c:if test="${'学习委员' eq sessionScope.user.stuJob}">selected</c:if>>学习委员</option>
								<option value="团支书" <c:if test="${'团支书' eq sessionScope.user.stuJob}">selected</c:if>>团支书</option>
								<option value="生活委员" <c:if test="${'生活委员' eq sessionScope.user.stuJob}">selected</c:if>>生活委员</option>

							</select>

						</div>
						<div class="form-group">
							<label>性别：</label>
							<select class="form-control bbb" name="stuSex" value="${ sessionScope.user.stuSex }" >
								<option value="男" <c:if test="${'男' eq sessionScope.user.stuSex}">selected</c:if>>男</option>
								<option value="女" <c:if test="${'女' eq sessionScope.user.stuSex}">selected</c:if>>女</option>


							</select>

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