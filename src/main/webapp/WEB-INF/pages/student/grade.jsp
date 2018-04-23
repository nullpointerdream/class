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
					<a class="btn btn-success" href="<%=basePath%>/stu/exportGrade">导出excel</a>
					<thead>
					<tr>
						<th data-column-id="stuid"  data-identifier="true" data-type="numeric">学号</th>
						<th data-column-id="stuname">姓名</th>
						<th data-column-id="course1">数据结构</th>
						<th data-column-id="course2">操作系统</th>
						<th data-column-id="course3">软件工程</th>
						<th data-column-id="course4">计算机组成原理</th>
						<th data-column-id="course5">计算机网络</th>
						<th data-column-id="course6">java</th>
						<th data-column-id="avg">平均</th>

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
				<h4 class="modal-title">修改学生成绩</h4>
			</div>
			<form method="post" id="upform">
				<div class="modal-body">
					<div class="form-group">
						<label for="stuid1">学号</label>
						<input type="text" name="stuid" class="form-control" id="stuid1" readonly>
					</div>
					<div class="form-group">
						<label for="stuname1">姓名</label>
						<input type="text" name="stuname" class="form-control" id="stuname1" readonly>
					</div>
					<div class="form-group">
					<label for="course11">数据结构</label>
					<input type="text" name="course1" class="form-control" id="course11">
				</div>
					<div class="form-group">
						<label for="course21">操作系统</label>
						<input type="text" name="course2" class="form-control" id="course21">
					</div>
					<div class="form-group">
						<label for="course31">软件工程</label>
						<input type="text" name="course3" class="form-control" id="course31">
					</div>
					<div class="form-group">
						<label for="course41">计算机组成原理</label>
						<input type="text" name="course4" class="form-control" id="course41">
					</div>
					<div class="form-group">
						<label for="course51">计算机网络</label>
						<input type="text" name="course5" class="form-control" id="course51">
					</div>
					<div class="form-group">
						<label for="course61">java</label>
						<input type="text" name="course6" class="form-control" id="course61">
						<input type="hidden" name="id" class="form-control" id="id1">
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id="updateClose" class="btn btn-default" data-dismiss="modal">关闭</button>
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
				<h4 class="modal-title">添加学生成绩</h4>
			</div>
			<form  method="post" id="addForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="stuName2">学生姓名</label>
						<select name="stuname" class="form-control" id="stuName2">
							 <c:forEach items="${userlist}" var="user">
								 <option value="${user.stuId}@${user.stuName}">${user.stuName}</option>

							 </c:forEach>


						</select>
					</div>


					<div class="form-group">
						<label for="course12">数据结构</label>
						<input type="text" name="course1" class="form-control" id="course12">
					</div>
					<div class="form-group">
						<label for="course22">操作系统</label>
						<input type="text" name="course2" class="form-control" id="course22">
					</div>
					<div class="form-group">
						<label for="course32">软件工程</label>
						<input type="text" name="course3" class="form-control" id="course32">
					</div>
					<div class="form-group">
						<label for="course42">计算机组成原理</label>
						<input type="text" name="course4" class="form-control" id="course42">
					</div>
					<div class="form-group">
						<label for="course52">计算机网络</label>
						<input type="text" name="course5" class="form-control" id="course52">
					</div>
					<div class="form-group">
						<label for="course62">java</label>
						<input type="text" name="course6" class="form-control" id="course62">
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="addClose" data-dismiss="modal">关闭</button>
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
            url:"<%=basePath%>/stu/gradelist",
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\">编辑<span class=\"fa fa-pencil\"></span></button> ";

                }
            }
        }).on("loaded.rs.jquery.bootgrid", function()
        {
            grid.find(".command-edit").on("click", function(e)
            {
                $(".stumodal").modal();
                $.post("<%=basePath%>/stu/getGradeInfo",{stuId:$(this).data("row-id")},function(str){
                    $("#stuid1").val(str.stuid);
                    $("#stuname1").val(str.stuname);
                    $("#course11").val(str.course1);
                    $("#course21").val(str.course2);
                    $("#course31").val(str.course3);
                    $("#course41").val(str.course4);
                    $("#course51").val(str.course5);
                    $("#course61").val(str.course6);
                    $("#id1").val(str.id);


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
            url: "<%=basePath%>/stu/updateGrade",
            data: $("#upform").serialize(),
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function(data){
                alert("修改成功");
                $("#updateClose").trigger("click");
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
            url: "<%=basePath%>/stu/addGrade",
            data: $("#addForm").serialize(),
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function(data){
                alert("添加成功");
                $("#addClose").trigger("click");
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