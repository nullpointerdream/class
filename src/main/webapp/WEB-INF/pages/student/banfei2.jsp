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
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
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
				<table id="grid-data" class="table table-condensed table-hover table-striped">

					<h2 id="remain">班费余额${remain}</h2>
					<thead>
					<tr>
						<th data-column-id="id"  data-identifier="true" data-type="numeric">id</th>
						<th data-column-id="addtime">支出时间</th>
						<th data-column-id="addr">地点</th>
						<th data-column-id="money">金额</th>
						<th data-column-id="people" data-order="desc">参与人员</th>
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
				<h4 class="modal-title">修改支出信息</h4>
			</div>
			<form method="post" id="upform">
				<div class="modal-body">
					<div class="form-group">
						<label for="addtime2">支出时间</label>
						<input type="text" name="addtime" class="form-control" id="addtime2">
					</div>
					<div class="form-group">
						<label for="addr2">地点</label>
						<input type="text" name="addr" class="form-control" id="addr2">
					</div>
					<div class="form-group">
						<label for="money2">金额</label>
						<input type="text" name="money" class="form-control" id="money2">
					</div>
					<div class="form-group">
						<label for="people2">参与人员</label>
						<input type="text" name="people" class="form-control" id="people2">
					</div>

					<input type="hidden" name="id" class="form-control" id="id2">
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
				<h4 class="modal-title">添加支出</h4>
			</div>
			<form  method="post" id="addForm">
				<div class="modal-body">
					<div class="form-group">
						<label for="addtime1">支出时间</label>
						<input type="text" name="addtime" class="form-control" id="addtime1">
					</div>
					<div class="form-group">
						<label for="addr1">地点</label>
						<input type="text" name="addr" class="form-control" id="addr1">
					</div>
					<div class="form-group">
						<label for="money1">金额</label>
						<input type="text" name="money" class="form-control" id="money1">
					</div>
					<div class="form-group">
						<label for="people1">参与人员</label>
						<input type="text" name="people" class="form-control" id="people1">
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
            url:"<%=basePath%>/stu/banfei"

        }).on("loaded.rs.jquery.bootgrid", function()
        {
            grid.find(".command-edit").on("click", function(e)
            {
                $(".stumodal").modal();
                $.post("<%=basePath%>/stu/getBanFeiInfo",{stuId:$(this).data("row-id")},function(str){
                    $("#addr2").val(str.addr);
                    $("#addtime2").val(str.addtime);
                    $("#money2").val(str.money);
                    $("#people2").val(str.people);
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
            url: "<%=basePath%>/stu/updatebanfei",
            data: $("#upform").serialize(),
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function(data){
                alert("修改成功");
                $("#remain").text(">班费余额"+data.data);
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
            url: "<%=basePath%>/stu/addBanFei",
            data: $("#addForm").serialize(),
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function(data){
                alert("添加成功");
                $("#remain").text(">班费余额"+data.data);
                $("#addClose").trigger("click");
                $("#grid-data").bootgrid("reload");
            },
            error:function(data,type, err){
                alert("ajax错误类型："+type);
                alert(err);
            }
        });
    });
    $('#addtime1').datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
    })
</script>
</html>