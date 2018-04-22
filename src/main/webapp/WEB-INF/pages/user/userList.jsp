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
					<a class="btn btn-primary" href="#" id="add">新增</a>
					<button class="btn btn-success" href="/stu/exportStu">导出excel</button>
					<thead>
					<tr>
						<th data-column-id="stuId"  data-identifier="true" data-type="numeric">学号</th>
						<th data-column-id="stuName">姓名</th>
						<th data-column-id="stuSex">性别</th>
						<th data-column-id="stuTel">联系方式</th>
						<th data-column-id="stuJob" data-order="desc">职位</th>
						<th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
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
				<h4 class="modal-title">修改学生信息</h4>
			</div>
			<form method="post" id="upform">
				<div class="modal-body">
					<div class="form-group">
						<label for="stuId2">学号</label>
						<input type="text" name="stuId" class="form-control" id="stuId2" >
					</div>
					<div class="form-group">
						<label for="stuName2">姓名</label>
						<input type="text" name="stuName" class="form-control" id="stuName2">
					</div>
					<div class="form-group">
						<label for="stuTel2">联系方式</label>
						<input type="text" name="stuTel" class="form-control" id="stuTel2">
					</div>
					<div class="form-group">
						<label for="stuJob2">职位</label>
						<select class="form-control bbb" name="stuJob" id="stuJob2" >
							<option value="学生">学生</option>
							<option value="班长">班长</option>
							<option value="学习委员">学习委员</option>
							<option value="团支书">团支书</option>
							<option value="生活委员">生活委员</option>

						</select>
						<input type="hidden" name="id" class="form-control" id="id2">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button  id="updateStu" type="button"  class="btn btn-primary">修改</button>
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
				<h4 class="modal-title">添加学生</h4>
			</div>
			<form  method="post" id="addForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="stuName1">学生姓名</label>
						<input type="text" name="stuName" class="form-control" id="stuName1">
					</div>
					<div class="form-group">
						<label for="stuId1">学号</label>
						<input type="text" name="stuId" class="form-control" id="stuId1">
					</div>
					<div class="form-group">
						<label for="username">学生账号</label>
						<input type="text" name="username" class="form-control" id="username">
					</div>
					<div class="form-group">
						<label for="password">学生密码</label>
						<input type="password" name="password" class="form-control" id="password">
					</div>
					<div class="form-group">
						<label for="stuMajor1">专业</label>
						<input type="text" name="stuMajor" class="form-control" id="stuMajor1">
					</div>
					<div class="form-group">
						<label for="stuTel1">联系方式</label>
						<input type="text" name="stuTel" class="form-control" id="stuTel1">
					</div>
					<div class="form-group">
						<label for="stuJob1">职位</label>
						<select class="form-control bbb" name="stuJob" id="stuJob1" >
							<option value="学生">学生</option>
							<option value="班长">班长</option>
							<option value="学习委员">学习委员</option>
							<option value="团支书">团支书</option>
							<option value="生活委员">生活委员</option>

						</select>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="addStu" type="button"  class="btn btn-primary">添加</button>
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
            url:"<%=basePath%>/user/allStudent",
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\">编辑<span class=\"fa fa-pencil\"></span></button> " +
                        "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\">删除<span class=\"fa fa-trash-o\"></span></button>";
                }
            }
        }).on("loaded.rs.jquery.bootgrid", function()
        {
            grid.find(".command-edit").on("click", function(e)
            {
                $(".stumodal").modal();
                $.post("<%=basePath%>/user/getStuInfo",{stuId:$(this).data("row-id")},function(str){
                    $("#stuId2").val(str.stuId);
                    $("#stuName2").val(str.stuName);
                    $("#stuTel2").val(str.stuTel);
                    $("#stuJob2").val(str.stuJob);
                    $("#id2").val(str.id);
                });
            }).end().find(".command-delete").on("click", function(e)
            {

                $.post("<%=basePath%>/user/delStu",{stuId:$(this).data("row-id")},function(){
                    alert("删除成功");
                    $("#grid-data").bootgrid("reload");
                });
            });
        });
    });

    $(document).ready(function(){
        $("#add").click(function(){

            $(".addmodal").modal();
        });
    });


    $("#updateStu").click(function(){
        $.ajax({
            type: "post",
            url: "<%=basePath%>/user/updateStu",
            data: $("#upform").serialize(),
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function(data){
                alert("修改成功");
                $("#grid-data").bootgrid("reload");
            },
            error:function(data,type, err){
                alert("ajax错误类型："+type);
                alert(err);
            }
        });
    });


    $("#addStu").click(function(){
        $.ajax({
            type: "post",
            url: "<%=basePath%>/user/addStu",
            data: $("#addForm").serialize(),
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function(data){
                alert("添加成功");
                $("#grid-data").bootgrid("reload");
            },
            error:function(data,type, err){
                alert("ajax错误类型："+type);
                alert(err);
            }
        });
    });

</script>
</html>