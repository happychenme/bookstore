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

        .container .row{margin-top: 20px;}

        .container .row .personInfo,.updatePassword,.myOrder,.inputInfo,.shipping{
            display: none;
        }

        .container .row ul li{line-height: 40px;}
        .container .row .le li{width: 120px;line-height: 40px;text-align: center;cursor: pointer;}
        .container .row .le li:hover{background: gainsboro;color: red;}
        .form{padding: 15px;}
        .form a{display: block;margin: 5px;}

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
        <a><span>MYMall></span><span>个人中心</span></a>
    </div>
</nav>

<div class="container">

    <div class="row">
        <ul class="le" style="width: 15%;padding: 0px;">
            <li class="person">个人中心</li>
            <li class="pass">修改密码</li>
            <li class="order">我的订单</li>
            <li class="guanyu">收货地址</li>
        </ul>

        <div class="personInfo" style="border: 1px solid gainsboro;width: 80%;margin-left: 5%;padding: 10px;display: block">

            <h4 style="border-bottom: 1px solid gainsboro;width: 99%;line-height: 40px;">我的信息</h4>
            <ul>
                <li>用户名:<a>${user.username}</a></li>
                <li>头像:<a><img src="${user.img}" style="width: 50px;height: 50px;border-radius: 50px;border: 1px solid white;"></a></li>
                <li>email:<a>${user.email}</a></li>
                <li>电话:<a>${user.phone}</a></li>
                <li>问题:<a>${user.question}</a></li>
                <li>答案:<a>${user.answer}</a></li>
            </ul>
            <button class="btn bianji" style="margin-left: 50px;background: #C60023;color: white;">编辑</button>
        </div>

        <div class="inputInfo" style="border: 1px solid gainsboro;width: 80%;margin-left: 5%;padding: 10px;">

            <h4 style="border-bottom: 1px solid gainsboro;width: 99%;line-height: 40px;">我的信息</h4>
            <form class="form" id="updateUser">
                <a>用户名:<input type="text" name="username" value="${user.username}" readonly="readonly" /></a>
                <a>email:<input type="text" name="email" required="required" value="${user.email}"/></a>
                <a>电话:<input type="text" name="phone" required="required" value="${user.phone}"/></a>
                <a>问题:<input type="text" name="question" required="required" value="${user.question}"/></a>
                <a>答案:<input type="text" name="answer" required="required" value="${user.answer}"/></a>
                <button class="btn updateUser" type="submit" style="margin-left: 50px;background: #C60023;color: white;">确认</button>
            </form>
        </div>

        <div class="shipping" style="border: 1px solid gainsboro;width: 80%;margin-left: 5%;padding: 10px;">

            <h4 style="border-bottom: 1px solid gainsboro;width: 99%;line-height: 40px;">添加收货地址</h4>
            <form class="form" id="shipping">
                <div class="" style="float: left;width: 40%;">
                    <a>收件人:<input type="text" name="receiverName" value=""/></a>
                    <a>联系电话:<input type="text" name="receiverPhone" required="required" value=""/></a>
                    <a>手机号码:<input type="text" name="receiverMobile" required="required" value=""/></a>
                    <a>省份:<input type="text" name="receiverProvince" required="required" value=""/></a>
                    <button class="btn shippingbtn" type="submit" style="margin-left: 50px;background: #C60023;color: white;">确认</button>
                </div>
                <div class="" style="float: right;width: 40%;">
                    <a>城市:<input type="text" name="receiverCity" value="" /></a>
                    <a>区县:<input type="text" name="receiverDistrict" required="required" value=""/></a>
                    <a>详细地址:<input type="text" name="receiverAddress" required="required" value=""/></a>
                    <a>邮政编号:<input type="text" name="receiverZip" required="required" value=""/></a>
                </div>
            </form>
        </div>

        <div class="updatePassword" style="border: 1px solid gainsboro;width: 80%;margin-left: 5%;padding: 10px;">
            <h4 style="border-bottom: 1px solid gainsboro;width: 99%;line-height: 40px;">修改密码</h4>
            <form class="form" id="updatePass">
                <a>原始密码：<input type="text" name="password" required="required" value=""/></a>
                <a>新 密 码：  <input type="text" name="newpwd" required="required" value=""/></a>
                <a>确认密码：<input type="text" name="renewpwd" required="required" value=""/></a>
                <button class="btn updatePass" type="submit" style="margin-left: 50px;background: #C60023;color: white;">确认</button>
            </form>
        </div>

        <div class="myOrder" style="border: 1px solid gainsboro;width: 80%;margin-left: 5%;padding: 10px;">

            <h4 style="border-bottom: 1px solid gainsboro;width: 99%;line-height: 40px;">我的订单</h4>
            <table class="table">
                <thead>
                <tr>
                    <th>商品信息</th>
                    <th>商品描述</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>金额</th>
                    <th>操作</th>
                    <th>查看详情</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="b">
                    <tr>
                    <td>${b.id}</td>
                    <td><img src="${b.img}"></td>
                    <td>${b.name}</td>
                    <td class="p">${b.price}</td>
                    <td>
                        数量
                    </td>
                    <td class="price">200</td>
                    <td>
                    <c:forEach items="${list}" var="b">
                        <tr>
                            <td>${b.id}</td>
                            <td><img src="${b.img}"></td>
                            <td>${b.name}</td>
                            <td class="p">${b.price}</td>
                            <td>
                                数量
                            </td>
                            <td class="price">200</td>
                            <td>

                            </td>
                        </tr>
                    </c:forEach>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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

    $(function(){

        $(function(){
            $('.le>li').each(function(index){
                $(this).on('click',function(){
                    $('.le>li').css("background","white");
                    $(this).css("background","gainsboro");
                })
            })
        })

        $(".person").click(function(){
            $(".personInfo").css("display","block");
            $(".updatePassword").css("display","none");
            $(".inputInfo").css("display","none");
            $(".myOrder").css("display","none");
            $(".shipping").css("display","none");
            window.location.href="/jsp/getUser.do";
        })

        $(".pass").click(function(){

            $(".personInfo").css("display","none");
            $(".updatePassword").css("display","block");
            $(".inputInfo").css("display","none");
            $(".myOrder").css("display","none");
            $(".shipping").css("display","none");

        })

        $(".order").click(function(){

            $(".personInfo").css("display","none");
            $(".updatePassword").css("display","none");
            $(".inputInfo").css("display","none");
            $(".myOrder").css("display","block");
            $(".shipping").css("display","none");
        })

        $(".guanyu").click(function(){
            $(".personInfo").css("display","none");
            $(".updatePassword").css("display","none");
            $(".inputInfo").css("display","none");
            $(".myOrder").css("display","none");
            $(".shipping").css("display","block");
            $(".form").on("click",".shippingbtn",function () {
                $.ajax({
                    type:"post",
                    url:"/jsp/addshipping.do",
                    data:$("#shipping").serialize(),
                    async:true,
                    success:function (data) {
                        alert(data.msg);
                    }
                });
            })

        })

        $(".bianji").click(function(){

            $(".personInfo").css("display","none");
            $(".updatePassword").css("display","none");
            $(".inputInfo").css("display","block");
            $(".myOrder").css("display","none");
            $.ajax({
                type:"post",
                url:"/jsp/getUser.do",
                async:true,
            });
        })
    })

    $(".updateUser").click(function(){
        $.ajax({
            type:"post",
            url:"/jsp/updateUser.do",
            data:$("#updateUser").serialize(),
            async:true,
            success:function (data) {
                if (data.msg=="修改成功")
                {
                    alert(data.msg);
                }
                else
                {
                    alert(data.msg);
                }
            }
        });
    })

    $(".updatePass").click(function(){
        $.ajax({
            type:"post",
            url:"/jsp/updatePass.do",
            data:$("#updatePass").serialize(),
            async:true,
            success:function (data) {
                alert(data.msg);
            }
        });
    })

</script>
</html>
