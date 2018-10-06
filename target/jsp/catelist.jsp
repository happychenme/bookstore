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

        *{padding: 0;margin: 0;list-style: none;}


        .category ul li{
            float: left;margin-right: 5px;
        }
        .category ul li:hover{color: red;cursor: pointer;}

        .carousel-inner img {
            width: 100%;
            height: 100%;
        }

        .paixu a{
            border: 1px solid gainsboro;width: 120px;text-align: center;font-size: 12px;padding: 5px 8px;
        }
        .book ul{
            width: 100%;
        }
        .book ul li{
            width: 19%;height: 300px;border: 1px solid gainsboro;float: left;padding: 10px 10px;margin-right: 1%;margin-bottom: 1%;background: #FFFFFF;
        }
        .book ul li img{
            width: 100%;height: 80%;
        }
        .book ul li span{font-size: 13px;}
        .footer{
            width: 100%;height: 200px;background: ghostwhite;padding-top: 20px;margin-top: 40px;color: gray;
        }

    </style>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
</head>
<body style="background: #F5F5F5;">

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
            <li class="nav-item">
                <a class="nav-link" href="#">个人中心</a>
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
                <form class="form-inline" style="width: 90%;height: 50px;" action="/jsp/searchBook.do">
                    <input class="form-control" name="name" type="text" placeholder="输入图书名称" style="width: 75%;height: 100%;border-radius: 0px">
                    <button class="btn btn-success" type="button" style="width: 15%;border-radius: 0px;height: 100%;font-size: 20px">搜索</button>
                </form>
            </div>
        </div>
    </div>
</div>

<nav class="navbar-nav navbar-expand-sm navbar-light" style="background: ghostwhite;color: gray;border-top: 2px solid orangered;padding-top: 5px;padding-bottom: 5px;">
    <div class="container">
        <a><span>MYMall></span><span>商品列表</span></a>
    </div>
</nav>

<div class="container" style="padding-top: 10px;padding-bottom: 20px;">
    <div class="paixu">
        <a style="background: orangered;color: whitesmoke;">推荐排序</a>
        <a href="#" style="">价格</a>
    </div>
</div>

<div class="container book">

    <ul>
        <c:forEach items="${page.list}" var="book">
            <li>
                <img src="img/miao/index/book_02.jpg">
                <h6 style="color: red;">￥${book.price}</h6>
                <span>${book.subtitle}</span>
            </li>
        </c:forEach>

        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
        <li>
            <img src="img/miao/index/book_02.jpg">
            <h6 style="color: red;">￥50.00</h6>
            <span>Q版漫画与经典故事融合</span>
        </li>
    </ul>


</div>
<br>
<div class="container" style="padding-bottom: 30px;clear: both;">
    <div class="">
        <ul class="pagination float-lg-right">
            <li class="page-item"><a class="page-link" href="/jsp/categoryList.do?pageNum=1">首页</a></li>
            <li class="page-item">
                <c:if test="${page.hasPreviousPage}">
                    <a class="page-link" href="/jsp/categoryList.do?pageNum=${page.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </c:if>
            </li class="page-item">
            <c:forEach items="${page.navigatepageNums}" var="page_num">
                <c:if test="${page_num == pageInfo.pageNum}">
                    <li class="active page-item"><a page-link href="/jsp/categoryList.do?pageNum=${page_num}">${page_num}</a></li>
                </c:if>
                <c:if test="${page_num != page.pageNum}">
                    <li class="page-item"><a class="page-link" href="/jsp/categoryList.do?pageNum=${page_num}">${page_num}</a></li>
                </c:if>
            </c:forEach>
            <li class="page-item">
                <c:if test="${page.hasNextPage}">
                    <a class="page-link" href="/jsp/categoryList.do?pageNum=${pageInfo.pageNum+1}"
                       aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </c:if>
            </li>
            <li class="page-item"><a class="page-link" href="/jsp/categoryList.do?pageNum=${page.pages}">尾页</a></li>
        </ul>
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
