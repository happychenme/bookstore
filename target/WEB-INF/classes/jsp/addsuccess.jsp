<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <base href="<%=basePath%>">
    <title></title>
    <style type="text/css">

        .card-footer .btn-danger{
            float: right;margin-right: 60px;
        }

        .table tr td a{
            border: 1px solid gainsboro;width: 5px;cursor: pointer;padding: 3px;
        }

        .footer{
            width: 100%;height: 200px;background: ghostwhite;padding-top: 20px;margin-top: 40px;color: gray;
        }

    </style>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
</head>
<body>

<nav class="navbar-nav navbar-expand-sm navbar-light" style="background: ghostwhite;color: white;">
    <div class="container">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">商家管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">注册/登录</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">我的订单</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">购物车</a>
            </li>
        </ul>
    </div>
</nav>

<div class="row" style="background: #FFFFFF;">
    <div class="container">
        <div class="row" style="height: 100px;padding-top: 30px;">
            <div class="col-4" >
                <a style="height: 40px;"><img src="img/mymmall.png"></a>

            </div>
            <div class="col-8" >
                <form class="form-inline" style="width: 90%;height: 50px;" action="/jsp/searchBook.do">
                    <input class="form-control" name="name" type="text" placeholder="输入图书名称" style="width: 75%;height: 100%;border-radius: 0px">
                    <button class="btn btn-success" type="submit" style="width: 15%;border-radius: 0px;height: 100%;font-size: 20px;margin-top: 0px;">搜索</button>
                </form>
            </div>
        </div>
    </div>
</div>

<nav class="navbar-nav navbar-expand-sm navbar-light" style="background: ghostwhite;color: gray;border-top: 2px solid orangered;padding-top: 5px;padding-bottom: 5px;">
    <div class="container">
        <a><span>MYMall></span><span>我的购物车</span></a>
    </div>
</nav>

<div class="container">


    <div class="card">
        <div class="card-header">
            <h3>我的购物车</h3>
        </div>
        <div class="card-body">
            <div style="text-align: center;">
                <h3>您的商品已成功加入购物车</h3>
            </div>
            <div style="text-align: center;margin-top: 5%;">
                <a href="/jsp/list.do" class="btn btn-info" role="button">继续购物</a><a href="/jsp/cartlist.do" class="btn btn-info" role="button" style="margin-left: 10px;">去购物车查看</a>
            </div>
        </div>
        <div class="card-footer">

        </div>
    </div>

</div>

<div class="footer">
    <div class="container" style="text-align: center;margin-top: 50px;">
        <span>作者:银华</span><a>  | </a><span>275905928@qq.com</span>
        <h5>Copyright © 2018 happymmall.com All Rights Reserved</h5>
    </div>
</div>
</body>
<script>

</script>
</html>
