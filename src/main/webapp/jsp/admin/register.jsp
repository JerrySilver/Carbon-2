<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.108.0">
  <title>Checkout example · Bootstrap v5.3</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">

  <link href="${pageContext.request.contextPath}/style/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .b-example-divider {
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }
  </style>


  <!-- Custom styles for this template -->
  <link href="checkout.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/style/images/login.gif" alt="" width="72" height="57">
      <h2>欢迎您的注册</h2>
      <p class="lead">感谢有您的关注，才让更多的人了解温室效应问题</p>
    </div>

    <div class="row g-5">
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">注册</h4>
        <form class="needs-validation">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">姓</label>
              <input type="text" class="form-control" id="firstName" placeholder="请输入你的姓氏" value="" required autofocus>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">名</label>
              <input type="text" class="form-control" id="lastName" placeholder="请输入你的名字" value="" required autofocus>
              <div class="invalid-feedback">
                Valid last name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">用户名</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="username" placeholder="请输入你的用户名" required autofocus>
                <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="password" class="form-label">密码</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="password" placeholder="请输入你的用户名" required autofocus>
                <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="button" onclick="doRegister()">注册</button>
        </form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2022 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>

<script src="${pageContext.request.contextPath}/style/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/style/js/checkout.js"></script>
</body>
</html>


<script>
  function doRegister() {
    var username=$("#username").val();
    var password=$("#password").val();
    var firstname = $("#firstName").val();
    var lastname = $("#lastName").val();

    if (name==''|| password==''){
      alert("请输入账号和密码");
    }else{
      $.ajax(
              {
                type:"post",
                url:"/register/doRegister",
                data:{
                  user_name:username,
                  password:password,
                  firstname:firstname,
                  lastName:lastname
                },
                async:false,  //使用ajax同步提交数据
                success:function (response) {
                  if (response=="User  existed"){
                    alert("用户已存在");
                  }
                  else  if (response=="ok"){
                    alert("注册成功,,,1秒后跳转到系统");
                    setTimeout(window.location.href="/admin/fang/list",1000);
                  }else{
                    alert("注册失败，请联系管理员....");
                  }
                }
              }
      );
    }
  }
</script>
