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

        table tr td{
            height: 100px;line-height: 100px;
        }
        table tr td input,.btn{
            line-height: 30px;margin-top: 35px;
        }
        table tr td img{
            width: 100px;height: 100%;
        }

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
            <table class="table">
                <thead>
                <tr>
                    <th>商品信息</th>
                    <th>商品描述</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                    <th>操作</th>
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
                            <input type="button" class="sub" value="-"><input type="text" size="3" class="num" value="${b.num}" readonly="readonly"><input type="button" class="add" value="+"><br>
                        </td>
                        <td class="price">${b.totalPrice}</td>
                        <td>
                            <button class="btn delete" type="button">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <a style="line-height: 50px;font-size: 20px;font-family: '微软雅黑';display: inline-block" class="total"></a>
            <a href="/jsp/getCartList.do" class="btn btn-info" style="float: right;display: inline-block" role="button">去结算</a>
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

    $(function () {

        function change()
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


        $(".table").on("click",".delete",function(){
            var id=$(this).parents("tr").find("td").eq(0).html();
            var _that=$(this);
            $.ajax({
                type:"post",
                url:"/jsp/deleteCartItem.do?id="+id,
                async:true,
                success:function(data){
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


        $(".add").click(function(){
            var n = $(this).parents("td").find("input").eq(1).val();
            var x=0;
            x=parseInt(n)+1;
            $(this).parents("td").find("input").eq(1).val(x);
            var sinprice=$(this).parents("tr").find("td").eq(3).html();
            var num=$(this).parents("td").find("input").eq(1).val();
            var price=sinprice*num;
            $(this).parents("tr").find("td").eq(5).html(price);
            change();
        })


        $(".sub").click(function(){
            var n = $(this).parents("td").find("input").eq(1).val();
            var x=0;
            x=parseInt(n)-1;
            if(x<=1)
            {
                x=1;
            }
            $(this).parents("td").find("input").eq(1).val(x);
            var sinprice=$(this).parents("tr").find("td").eq(3).html();
            var num=$(this).parents("td").find("input").eq(1).val();
            var price=sinprice*num;
            $(this).parents("tr").find("td").eq(5).html(price);
            change();
        })

    })

</script>
</html>
