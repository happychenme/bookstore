<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <base href="<%=basePath%>">
    <title>主页</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
    <style type="text/css">

        *{padding: 0;margin: 0;list-style: none;}

        .category{
            height: 50%;
        }

        .category ul li{
            float: left;margin-right: 10px;
        }
        .category ul li:hover{color: red;cursor: pointer;}

        .carousel-inner img {

        }

        .container h3{margin-top: 50px;}
        .card{
            width:200px;height: 330px;
            margin-left: 15px;margin-bottom: 20px;
        }
        .card-body .card-text{
            font-size: small;
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

<nav class="navbar-nav navbar-expand-sm navbar-light" style="background: ghostwhite;color: white;width: 100%;padding-left: 15%;box-sizing: border-box">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/jsp/toadmin.do">商家管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/tologin.do">注册/登录</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">我的订单</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/cartlist.do">购物车</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/getUser.do">个人中心</a>
            </li>
        </ul>
        <span class="navbar-text" style="margin-left: 50%">
            ${currentUser.username}
        </span>
</nav>

<div class="container">
    <div class="row" style="height: 100px;padding-top: 30px;">
        <div class="col-4" >
            <a style="height: 40px;"><img src="img/mymmall.png"></a>

        </div>
        <div class="col-8">
            <form class="form-inline" style="width: 90%;height: 50px;" action="/jsp/searchBook.do">
                <input class="form-control" name="name" type="text" placeholder="输入图书名称" style="width: 75%;height: 100%;border-radius: 0px">
                <button class="btn btn-success" type="submit" style="width: 15%;border-radius: 0px;height: 100%;font-size: 20px">搜索</button>
            </form>
        </div>
    </div>
</div>

<div class="row" style="background: ghostwhite;border-top: 2px solid orangered;">

    <div class="container">
        <div class="row">

            <div class="col-3" style="">
                <div class="container bg-dark text-light category" style="padding-top: 40px;">
                    <ul>
                        <c:forEach items="${list}" var="list">
                            <li><h6>${list.name}</h6></li>
                        </c:forEach>
                    </ul><br>
                </div>
            </div>
            <div class="col-9">
                <div id="demo" class="carousel slide" data-ride="carousel" style="">

                    <!-- 指示符 -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>

                    <!-- 轮播图片 -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="http://static.runoob.com/images/mix/img_fjords_wide.jpg" >
                            <div class="carousel-caption">
                                <h3>第一张图片描述标题</h3>
                                <p>描述文字!</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="http://static.runoob.com/images/mix/img_nature_wide.jpg">
                            <div class="carousel-caption">
                                <h3>第二张图片描述标题</h3>
                                <p>描述文字!</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="http://static.runoob.com/images/mix/img_mountains_wide.jpg">
                            <div class="carousel-caption">
                                <h3>第三张图片描述标题</h3>
                                <p>描述文字!</p>
                            </div>
                        </div>
                    </div>

                    <!-- 左右切换按钮 -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>
            </div>
        </div>

    </div>

</div>



<div class="container" style="background: ghostwhite;height: 200%">
    <h3>人文军事</h3>
    <c:forEach items="${books}" var="book">
        <div class="card" style="float: left;border: 1px solid ghostwhite;">
            <img class="card-img-top" src="${book.mainImage}" alt="Card image" style="width:100%;height: 200px;">
            <div class="card-body">
                <a class="id" style="display: none">${book.id}</a>
                <p class="card-text">${book.name} </p>
                <a>￥<span style="color: red">${book.price}</span>元</a>
            </div>
        </div>
    </c:forEach>
</div>

<div class="footer">
    <div class="container" style="text-align: center;margin-top: 50px;">
        <span>作者:银华</span><a>  | </a><span>275905928@qq.com</span>
        <h5>Copyright © 2018 All Rights Reserved</h5>
    </div>
</div>
</body>
<script>

    $(".card").click(function(){
        var id=$(this).find("a").html();
        $.ajax({
            type:"post",
            url:"jsp/toBuyBook.do?id="+id,
            async:true,
            success:function(){
                window.location.href="/jsp/toBuyBook.do?id="+id;
            }
        });

    })

</script>>
</html>
