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
        *{list-style: none;}
        table tr td{
            height: 150px;line-height: 150px;
        }
        table tr td img{
            width: 50%;height: 100%;
        }
        .address ul{
            float: left;margin-right: 10px;
        }

        .card-footer .btn-danger{
            float: right;margin-right: 60px;
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
            <div class="col-8">
                <div class="input-group" style="width: 500px;">
                    <input type="text" class="form-control" placeholder="请输入图书名称" id="mail" name="email" style="height: 50px;">
                    <div class="input-group-append">
                        <a href="#" class="btn btn-info input-group-text" role="button" style="height: 50px;width: 100px; text-align: center;font-size: 20px;">搜索</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar-nav navbar-expand-sm navbar-light" style="background: ghostwhite;color: gray;border-top: 2px solid orangered;padding-top: 5px;padding-bottom: 5px;">
    <div class="container">
        <a><span>MYMall></span><span>订单支付</span></a>
    </div>
</nav>

<div class="container" style="text-align: center;">
    <h3>订单提交成功，请您尽快支付！ 订单号：<input type="text" id="orderNo" value="${orderNo}" readonly="readonly"></h3>
    <h3 style="color: red;">请使用支付宝扫描如下二维码进行支付：</h3>
    <p></p>
</div>

<!--
    作者：275905928@qq.com
    时间：2018-08-23
    描述：
-->
<div class="footer">
    <div class="container" style="text-align: center;margin-top: 50px;">
        <span>作者:银华</span><a>  | </a><span>275905928@qq.com</span>
        <h5>Copyright © 2018 happymmall.com All Rights Reserved</h5>
    </div>
</div>


</body>

<script>
    window.onload=function () {
        var orderNo=$("#orderNo").val();
        $.ajax({
            type:"post",
            url:"/jsp/pay.do?orderNo="+orderNo,
            async:true,
            success:function (d) {
                $("p").append("<img src="+d.data.qrUrl+" >");
                console.log(d);
                console.log(d.qrUrl);
            }
        });

    }
</script>

</html>