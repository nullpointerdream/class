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
    <style>
        a {
            color: #fff;
            text-decoration: none;
        }
        .sidebar-menu {

            float: left;

            top: 0;
            left: 0;
            bottom: 0;
            background-color: #BDBDBD;
            color: #aaabae;
            box-shadow: 0px 0px 10px 0px rgb(58, 41, 31);
            -o-box-shadow: 0px 0px 10px 0px rgb(58, 41, 31);
            -webkit-box-shadow: 0px 0px 10px 0px rgb(58, 41, 31);
            -moz-box-shadow: 0px 0px 10px 0px rgb(58, 41, 31);
            z-index: 999;
        }
    </style>
</head>
<body>

<!-- 搭建展示页面 -->
<div class="container-fluid ">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12" style="    background-color: #63B8FF;">
            <h1><font   color="#fff;" >班级管理</font></h1>
            <h5><a href="<%=basePath%>/user/logout">logout</a></h5>
        </div>


        <!-- 导航条显示 -->
        <div class="container-fluid">

            <div class="row ">
                <!-- 导航条 -->
                <div class="col-md-3 sidebar-menu ">
                    <ul id="main-nav" class="nav nav-tabs nav-stacked">
                        <!--一级菜单-->
                        <li>
                            <a style=" color: #fff;" class="collapsed" data-toggle="collapse" data-target="#content">
                                班级事务中心
                                <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                            </a>
                            <!--二级菜单-->
                            <ul  id="content" class="nav nav-list collapse list-group">
                                <li  ><a style=" color: #fff;" href="#" onclick="guanli();">&nbsp;&nbsp;&nbsp;&nbsp;班级基本信息</a></li>
                                <li  ><a style=" color: #fff;" href="#" onclick="banji();">&nbsp;&nbsp;&nbsp;&nbsp;班级消息文件</a></li>
                                <li  ><a style=" color: #fff;" href="#" onclick="leave();">&nbsp;&nbsp;&nbsp;&nbsp;我要离校</a></li>
                                <li  ><a style=" color: #fff;" href="#" onclick="banfeilist2();">&nbsp;&nbsp;&nbsp;&nbsp;班费支出</a></li>
                            </ul>
                        </li>
                        <!--一级菜单-->
                        <li>
                            <a style=" color: #fff;" class="collapsed " data-toggle="collapse" data-target="#content2">
                               学生信息中心
                                <span class="pull-right glyphicon  glyphicon-chevron-down"></span>
                            </a>
                            <!--二级菜单-->
                            <ul    id="content2" class="nav nav-list collapse ">
                                <li ><a style=" color: #fff;" href="#" onclick="geren();">&nbsp;&nbsp;&nbsp;&nbsp;个人基本信息</a></li>
                                <li><a style=" color: #fff;" href="#" onclick="mychengji();">&nbsp;&nbsp;&nbsp;&nbsp;成绩</a></li>
                            </ul>
                        </li>
                        <li>
                            <a style=" color: #fff;" class="collapsed " data-toggle="collapse" data-target="#content4">
                                财务收支中心
                                <span class="pull-right glyphicon  glyphicon-chevron-down"></span>
                            </a>
                            <!--二级菜单-->
                            <ul    id="content4" class="nav nav-list collapse ">
                                <li ><a style=" color: #fff;" href="#" onclick="jiaofei();">&nbsp;&nbsp;&nbsp;&nbsp;我要缴费</a></li>
                                <li  ><a style=" color: #fff;" href="#" onclick="banfeilist2();">&nbsp;&nbsp;&nbsp;&nbsp;班费支出</a></li>

                            </ul>
                        </li>
<c:if test="${ sessionScope.user.stuJob=='班长' }">
                        <li>
                            <a style=" color: #fff;" class="collapsed " data-toggle="collapse" data-target="#content3">
                               后台管理
                                <span class="pull-right glyphicon  glyphicon-chevron-down"></span>
                            </a>
                            <!--二级菜单-->
                            <ul    id="content3" class="nav nav-list collapse ">
                                <li ><a style=" color: #fff;" href="#" onclick="student();">&nbsp;&nbsp;&nbsp;&nbsp;学生信息</a></li>
                                <li><a style=" color: #fff;" href="#" onclick="chengji();">&nbsp;&nbsp;&nbsp;&nbsp;成绩</a></li>
                                <li ><a style=" color: #fff;" href="#" onclick="shiwu();">&nbsp;&nbsp;&nbsp;&nbsp;班级事务中心</a></li>
                                <li ><a style=" color: #fff;" href="#" onclick="lixiao();">&nbsp;&nbsp;&nbsp;&nbsp;离校信息</a></li>
                                <li ><a style=" color: #fff;" href="#" onclick="jiaofeilist();">&nbsp;&nbsp;&nbsp;&nbsp;缴费信息</a></li>
                                <li ><a style=" color: #fff;" href="#" onclick="banfeilist();">&nbsp;&nbsp;&nbsp;&nbsp;班费支出</a></li>
                            </ul>

                        </li>
</c:if>
                    </ul>
                </div>


                <!-- 右侧内容 -->
                <div class="main_content"></div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    $(function(){
        $(".collapsed").click(function(e){
            /*切换折叠指示图标*/
            $(this).find("span").toggleClass("glyphicon-chevron-down");
            $(this).find("span").toggleClass("glyphicon-chevron-up");


        });
    });




    function guanli(){
       // $(".main_content").load("/stu/student/stuList");
       $(".main_content").load("<%=basePath%>/user/student/stuList");
    };
    function geren(){
        $(".main_content").load("<%=basePath%>/user/userInfo");
    };
    function leave(){
        $(".main_content").load("<%=basePath%>/user/leaveSchool");
    };
    function student(){
        $(".main_content").load("<%=basePath%>/user/user/allStudent");
    };
    function shiwu(){
        $(".main_content").load("<%=basePath%>/stu/student/shiwu");
    };
    function banji(){
        $(".main_content").load("<%=basePath%>/user/user/shiwu");
    };
    function lixiao(){
        $(".main_content").load("<%=basePath%>/stu/student/leavelist");
    };
    function chengji(){
        $(".main_content").load("<%=basePath%>/stu/student/grade");
    };
    function mychengji(){
        $(".main_content").load("<%=basePath%>/stu/student/grade2");
    };
    function jiaofei(){
        $(".main_content").load("<%=basePath%>/user/user/money");
    };
    function jiaofeilist(){
        $(".main_content").load("<%=basePath%>/stu/student/money");
    };
    function banfeilist(){
        $(".main_content").load("<%=basePath%>/stu/student/banfei");
    };
    function banfeilist2(){
        $(".main_content").load("<%=basePath%>/stu/student/banfei2");
    };
</script>
</html>