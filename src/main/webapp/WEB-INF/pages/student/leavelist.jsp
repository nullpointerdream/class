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

					<a class="btn btn-success" href="<%=basePath%>/stu/exportLeave">导出excel</a>
					<thead>
					<tr>
						<th data-column-id="stuid"  data-identifier="true" data-type="numeric">学号</th>
						<th data-column-id="stuname">姓名</th>
						<th data-column-id="stureson">离校原因</th>
						<th data-column-id="sturaddr">离校地址</th>
						<th data-column-id="stutel">联系方式</th>
						<th data-column-id="stuparetel">父母联系方式</th>
						<th data-column-id="starttime">离校日期</th>
						<th data-column-id="returntel">返校日期</th>
			<%--
						<th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>--%>
					</tr>
					</thead>
				</table>


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
            url:"<%=basePath%>/stu/leavelist"
          /*  formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\">编辑<span class=\"fa fa-pencil\"></span></button> " +
                        "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\">删除<span class=\"fa fa-trash-o\"></span></button>";
                }
            }*/
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



</script>
</html>