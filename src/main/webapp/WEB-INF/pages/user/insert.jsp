<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>软工14信息填表处</title>
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="<%=basePath%>/js/jquery.bootgrid.min.js"></script>

    <style>
        * {
            color: #ffffff;
        }

        body {
            background-image: url("<%=basePath%>/images/blur.jpg");
            background-size: 100% 100%;
        }

        #ctn {
            border-radius: 15px;
        }

        #ctn input, textarea {
            background: rgba(0, 0, 0, 0);
            border-radius: 4px;
            height: 30px;
        }

        #ctn button {
            background: rgba(0, 0, 0, 0);
            border-radius: 6px;
            width: 100px;
        }

        #ctn table {
            margin-top: 20px;
        }

        .ctn_size {
            width: 500px;
            height: auto;
            margin-top: 80px;
            background-color: rgba(255, 255, 255, 0.2);
            text-align: center;
        }
    </style>
</head>
<body>
<div id="ctn" class="container ctn_size">
    <form action="<%=basePath%>/user/insertUser" method="post">
        <table class="table">
            <tbody>
            <tr>
                <td>账号</td>
                <td>
                    <div><input type="text" name="user_name"><input type="hidden" name="type" required></div>
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <div><input type="password" name="password" required></div>
                </td>
            </tr>
            <tr>
                <td>姓名</td>
                <td>
                    <div><input type="text" name="stuName" required></div>
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="radio" name="stuSex" value="男" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="stuSex" value="女">女
                </td>
            </tr>
            <tr>
                <td>学号</td>
                <td>
                    <div><input type="text" name="stuId" required></div>
                </td>
            </tr>
            <tr>
                <td>专业名称</td>
                <td>
                    <div><input type="text" name="stuMajor" required></div>
                </td>
            </tr>
            <tr>
                <td>籍贯</td>
                <td>
                    <div><input type="text" name="stuAddr" required></div>
                </td>
            </tr>
            <tr>
                <td>联系号码（或短号）</td>
                <td>
                    <div><input type="text" name="stuTel" required></div>
                </td>
            </tr>

            <tr>
                <td align="center">
                    <button type="submit">提交</button>
                </td>
                <td align="center">
                    <button type="reset">重置</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form>


</div>
<script>







</script>
</body>
</html>
