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
					<thead>
					<tr>
						<th data-column-id="id"  data-identifier="true" data-type="numeric">id</th>
						<th data-column-id="title">标题</th>
						<th data-column-id="file">文件名</th>
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
				<h4 class="modal-title">查看详情信息</h4>
			</div>
			<form method="post" id="upform">
				<div class="modal-body">

					<div class="form-group">
						<label for="title4">标题</label>
						<input type="text" name="title" class="form-control" id="title4" />
					</div>


					<div class="form-group">
						<label for="title2">内容</label>
						<textarea type="text" name="title" class="form-control" id="title2" ></textarea>
					</div>


					</div>

				<div class="modal-footer">
					<button type="button" id="updateClose" class="btn btn-default" data-dismiss="modal">关闭</button>
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
				<h4 class="modal-title">添加信息</h4>
			</div>
			<form  method="post" id="addForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="title1">标题</label>
						<input type="text" name="title" class="form-control" id="title1">
					</div>
					<div class="form-group">
						<label for="content1">内容</label>
						<textarea name="content" class="form-control" id="content1"></textarea>
					</div>
					<div class="form-group">
						<input type="file" name="file" id="upload" style="display:none;"/>
						<button type="button" id="select" class="btn btn-primary">选择文件</button>
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
            url:"<%=basePath%>/stu/shiwu",
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\">查看详情<span class=\"fa fa-pencil\"></span></button> " +
                        "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.file + "\">下载文件<span class=\"fa fa-trash-o\"></span></button>";
                }
            }
        }).on("loaded.rs.jquery.bootgrid", function()
        {
            grid.find(".command-edit").on("click", function(e)
            {
                $(".stumodal").modal();
                $.post("<%=basePath%>/stu/getShiWuInfo",{stuId:$(this).data("row-id")},function(str){
                    $("#title2").val(str.content);
                    $("#title4").val(str.title);
                    $("#id2").val(str.id);
                });
            }).end().find(".command-delete").on("click", function(e)
            {
                if($(this).data("row-id")==""||$(this).data("row-id")=="undefined"){
                    alert("暂无文件");
                    return false;
				}
                window.location.href="<%=basePath%>/stu/downfile?url="+$(this).data("row-id");
            }).end().find(".command-delete2").on("click", function(e)
            {
                $.get("<%=basePath%>/stu/delStu",{stuId:$(this).data("row-id")},function(str){
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
                $("#updateClose").trigger("click");
                $("#grid-data").bootgrid("reload");
            },
            error:function(data,type, err){
                alert("ajax错误类型："+type);
                alert(err);
            }
        });
    });

    $("#select").click(function(){
        $("#upload").trigger("click");

    });

    $("#addStu").click(function(){
        var formData = new FormData($( "#addForm" )[0]);  // 要求使用的html对象
        $.ajax({
            type: "post",
            url: "<%=basePath%>/stu/addShiWu",
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
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