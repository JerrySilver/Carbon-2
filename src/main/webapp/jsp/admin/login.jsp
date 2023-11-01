<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>登录页面</title>


    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/style/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/style/js/jquery-3.5.1.js"></script>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/style/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">

<form class="form-signin">
    <img class="mb-4" src="${pageContext.request.contextPath}/style/images/login.gif" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">管理员登录</h1>
    <label for="inputName" class="sr-only">账号</label>
    <input type="text" id="inputName" class="form-control" placeholder="账号" required autofocus>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="密码" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> 记住我
        </label><br/>
        <label>
            没有密码，<a href="demo.jsp" >点我注册</a>
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="button" onclick="doLogin()">登录</button>
<%--    <p class="mt-5 mb-3 text-muted">&copy; 2017-2023</p>--%>
</form>



</body>
</html>

<script>
    function doLogin() {
        var name=$("#inputName").val();
        var password=$("#inputPassword").val();
        if (name==''|| password==''){
            alert("请输入账号和密码");
        }else{
            $.ajax(
                {
                    type:"post",
                    url:"/admin/doLogin",
                    data:{
                        userName:name,
                        password:password
                    },
                    async:false,  //使用ajax同步提交数据
                    success:function (response) {
                        if (response=="username-error"){
                            alert("用户账户输入错误");
                        }else  if (response=="password-error"){
                            alert("密码输入错误");
                        }else  if (response=="ok"){
                            alert("登录成功,,,1秒后跳转到系统主页");
                            setTimeout(window.location.href="/admin/fang/list",1000);
                        }else{
                            alert("登录失败，请联系管理员....");
                        }
                    }
                }
            );
        }
    }
</script>


