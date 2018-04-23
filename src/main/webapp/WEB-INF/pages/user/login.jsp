<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>

<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="<%=basePath%>/js/jquery.bootgrid.min.js"></script>
    <style>

        * {
            color: #000000;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background-image: url("<%=basePath%>/images/bizhi.jpg");
            background-size: 100% 100%;
        }

        .lgContainer {
            position: absolute;
            left: 50%;
            top: 50%;
            /*border: 3px solid #2b542c;*/
            width: 500px;
            height: 350px;
            margin-left: -250px;
            margin-top: -175px;

            border-radius: 35px;
            background-color: rgba(255, 255, 255, 0.3);
        }

        #title {
            /*border: solid 2px #2b542c;*/
            width: 200px;
            margin-left: 150px;
            margin-top: 30px;
            text-align: center;
        }

        #lgTable {
            width: 300px;
            margin-top: 20px;
            margin-left: 100px;
            border-collapse: separate;
            border-spacing: 0px 40px;
        }

        #lgTable .qtd {
            width: 100px;
        }

        .blur {
            -webkit-filter: blur(4px);
            filter: blur(4px);
        }
    </style>
</head>
<body>

<nav id="mynav" class="navbar" role="navigation">
    <div class="container-fluid" style="text-align: center">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span> 软件工程14</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-off"></span> 退出</a></li>

        </ul>
        <div>
            <p class="navbar-text">用户登录</p>
        </div>
    </div>
</nav>
<div class="lgContainer">
    <div id="title"><h3>登陆</h3></div>
<form  id="form">
    <table id="lgTable">
        <tr>
            <td class="qtd">账号：</td>
            <td><input class="form-control" type="text" id="username" name="username" placeholder="请输入您的账号"/></td>
        </tr>
        <tr>
            <td class="qtd">密码：</td>
            <td><input class="form-control" type="password" id="password" name="password" placeholder="请输入您的密码"/></td>
        </tr>
        <tr>
            <td  class="qtd">

            </td>
            <td>
                <a href="<%=basePath%>/user/register" class="btn btn-danger btn-sm " > 注册</a>
                <button id="submit" type="button" class="btn btn-sm btn-success">登录</button>
            </td>

        </tr>
    </table>
</form>
</div>


<script>
   $("#submit").click(function(){

       $.ajax({
           type: "post",
           url: "<%=basePath%>/user/loginValidate",
           data: $("#form").serialize(),
           dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
           success: function(data){
               if(data.code==200){
                   window.location.href="<%=basePath%>/user/list";
               }else{
                   alert(data.msg);
               }
           }
       });
   });
    $(document).ready(function () {
        $(".lgContainer").hover(
            function () {
                $(this).css({
                    backgroundColor: "rgba(255,255,255,0.45)"
                });
            },
            function () {
                $(this).css({
                    backgroundColor: "rgba(255,255,255,0.3)"
                });
            }
        );


    });



</script>
</body>
</html>
