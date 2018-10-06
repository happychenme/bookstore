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
            height: 100px;line-height: 100px;
        }
        table tr td input,.btn{
            line-height: 30px;margin-top: 35px;
        }
        table tr td img{
            width: 100px;height: 100%;
        }
        .address{
            overflow: scroll;//超出就显示一个下拉框
            overflow-y: scroll;////啷个不得行哎
        }
        .address ul{
            float: left;margin-right: 5px;cursor: pointer;
        }

        .card-footer .btn-danger{
            float: right;margin-right: 60px;
        }

        .footer{
            width: 100%;height: 200px;background: ghostwhite;padding-top: 20px;margin-top: 40px;color: gray;
        }

    </style>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
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
        <a><span>MYMall></span><span>订单确认</span></a>
    </div>
</nav>

<div class="container">


    <div class="card">
        <div class="card-header address">
            <h3>收货地址</h3>
            <c:forEach items="${ship}" var="s">
                <ul class="ul" style="border: 2px dashed gainsboro;width: 20%;height: 30%;">
                    <li style="display: none">${s.id}</li>
                    <li>收件人: ${s.receiverName}</li>
                    <li>省份: ${s.receiverProvince}</li>
                    <li>地址: ${s.receiverCity}${s.receiverDistrict}${s.receiverDistrict}${receiverAddress}</li>
                    <li>手机: ${s.receiverMobile}</li>
                    <li style="margin: 5px;"><a href="" class="btn" role="button">编辑</a><a class="btn deleteship" role="button">删除</a></li>
                </ul>
            </c:forEach>
        </div>
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th>商品信息</th>
                    <th>商品描述</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="b">
                    <tr class="tr">
                        <td style="display: none">${b.id}</td>
                        <td><img src="${b.img}"></td>
                        <td>${b.name}</td>
                        <td class="p">${b.price}</td>
                        <td>
                            <input type="text" size="3" class="num" value="${b.num}" readonly="readonly"/>
                        </td>
                        <td class="price">${b.totalPrice}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <a style="line-height: 50px;font-size: 20px;font-family: '微软雅黑';">订单总价:<span style="color: red;"></span></a>
            <button type="button" id="btn" class="btn" style="width: 100px;height: 50px;float: right;">提交订单</button>
        </div>
    </div>

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


<!--
    作者：275905928@qq.com
    时间：2018-08-23
    描述：
-->
<div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">添加分类信息</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="borrow" style="margin-top: 20px;" action="" method="post">

                    <div class="form-inline">
                        <label class="w-25">分类名:</label>
                        <input type="text" class="form-control w-75"  name="name" placeholder="（eg:文学艺术，科学教育）">
                    </div>
                    <br/>

                    <div class="form-group">
                        <div class="offset-5">
                            <button type="submit" class="btn btn-primary">  确  认  </button>
                            <button type="reset" class="btn btn-primary">  重  置  </button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>
</body>
<script>

    $(".deleteship").click(function(){
        var id=$(this).parents("ul").find("li").eq(0).html();
        var _that=$(this);
        $.ajax({
            type:"post",
            url:"/jsp/deleteShip.do?id="+id,
            async:true,
            success:function (data) {
                if (data.msg=="删除成功")
                {
                    _that.parents("tr").remove();
                }
                else
                {
                    alert(data.msg);
                }
            }
        });
    })
     var id;
    $('.ul').each(function(index){
        $(this).on('click',function(){
            $('.ul').css("border","2px dashed gainsboro");
            $(this).css("border","2px dashed red");
            id=$(this).find("li").eq(0).html();

        })
    })

    window.onload=function change()
    {
        var tr=$(".tr");
        var total=0;
        for(var i=0;i<tr.length;i++)
        {
            var td = tr.eq(i).children().eq(5);
            var price = parseInt($(td).text());
            total+=price;
        }
        $(".total").html("<p>总价:<span style='color: red'>￥"+total+"</span></p>");
    }

    $("#btn").click(function () {
         window.location=href="jsp/Order.do?shippingId="+id;
    })


</script>
</html>
