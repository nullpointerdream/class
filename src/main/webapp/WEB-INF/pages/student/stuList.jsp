<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="<%=basePath%>/css/jquery.bootgrid.min.css">
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
				<table id="grid-data" class="table table-condensed table-hover table-striped">
					<%--<a class="btn btn-primary" href="#" id="add">新增</a>
					<button class="btn btn-success" href="/stu/exportStu">导出excel</button>--%>
						<div class="col-md-12">
							<h1>${ sessionScope.user.stuMajor }</h1>

						</div>
					<thead>
					<tr>
						<th data-column-id="stuId"  data-identifier="true" data-type="numeric">学号</th>
						<th data-column-id="stuName">姓名</th>
						<th data-column-id="stuSex">性别</th>
						<th data-column-id="stuJob" data-order="desc">职位</th>

					</tr>
					</thead>
				</table>


		</div>
	</div>
</div>


<div class="modal fade stumodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">update Stu</h4>
			</div>
			<form action="/stu/updateStu" method="post">
				<div class="modal-body">
					<div class="form-group">
						<label for="stuId2">stuId</label>
						<input type="text" name="stuId" class="form-control" id="stuId2" readonly="true">
					</div>
					<div class="form-group">
						<label for="stuName2">stuName</label>
						<input type="text" name="stuName" class="form-control" id="stuName2">
					</div>
					<div class="form-group">
						<label for="stuAge2">stuAge</label>
						<input type="text" name="stuAge" class="form-control" id="stuAge2">
					</div>
					<div class="form-group">
						<label for="stuMajor2">stuMajor</label>
						<input type="text" name="stuMajor" class="form-control" id="stuMajor2">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade addmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">add stu</h4>
			</div>
			<form action="/stu/addStu" method="post">
				<div class="modal-body">
					<div class="form-group">
						<label for="stuName1">stuName</label>
						<input type="text" name="stuName" class="form-control" id="stuName1">
					</div>
					<div class="form-group">
						<label for="stuAge1">stuAge</label>
						<input type="text" name="stuAge" class="form-control" id="stuAge1">
					</div>
					<div class="form-group">
						<label for="stuMajor1">stuMajor</label>
						<input type="text" name="stuMajor" class="form-control" id="stuMajor1">
					</div>
					<div class="form-group">
						<input type="hidden" name="Id" class="form-control" id="Id">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Add Stu</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">

    $(document).ready(function(){
        var grid = $("#grid-data").bootgrid({
            ajax:true,
            post: function ()
            {
                return {
                    id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url:"<%=basePath%>/user/userList"

        }).on("loaded.rs.jquery.bootgrid", function()
        {

        });
    });

    $(document).ready(function(){
        $("#add").click(function(){

            $(".addmodal").modal();
        });
    });

</script>
</html>