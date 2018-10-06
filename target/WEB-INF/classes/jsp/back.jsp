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
        .aaa dl{
            width: 100%;border-bottom: 1px solid gainsboro;padding: 10px;
        }
        .aaa dl dd{
            margin-left: 15px;cursor: pointer;
        }
        .aaa dl dd:hover{
            background: ghostwhite;
        }

        .head #iframes{
            scrolling : no;
            width: 100%;
            height: 100%;
            border: none;
        }

    </style>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
</head>

<body>

<nav class="navbar navbar-expand-sm" style="background: #F5F5F5;border-bottom: 1px solid gainsboro;color: black;">
    <a class="navbar-brand" style="color: gray;">后台管理</a>
    <ul class="navbar-nav" style="float: left;margin-left: 80%;">
        <li class="nav-item">
            <a class="nav-link">欢迎你</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">${sessionScope.currentUser.username}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/jsp/loginOut.do">退出</a>
        </li>
    </ul>
</nav>

<div class="" style="width: 100%;height:800px;">
    <div class="" style="background: #F5F5F5;height: 100%;width: 16%;float: left;border-right: 1px solid gainsboro;">
        <div class="aaa">
            <dl>
                <dt>HOME</dt>
            </dl>
            <dl>
                <dt>商品</dt>
                <dd id="bookManager">图书管理</dd>
                <dd id="categoryManager">品类管理</dd>
            </dl>
            <dl>
                <dt>订单</dt>
                <dd id="orderManager">订单管理</dd>
            </dl>
        </div>
    </div>
    <div class="head" style="background: #FFFFFF;width: 84%;float: left;">
        <iframe class="iframes" id="iframes" src="/jsp/home.jsp"></iframe>
    </div>
</div>

</body>
<script type="text/javascript">

    $("#bookManager").click(function() {
        var iframes = document.getElementById("iframes");
        iframes.src = "/jsp/bookList.do";
    });
    $("#categoryManager").click(function() {
        var iframes = document.getElementById("iframes");
        iframes.src = "/jsp/categoryList.do";
    });

</script>
</html>
