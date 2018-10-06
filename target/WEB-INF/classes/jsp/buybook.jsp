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

        .form-inline{
            margin-left: 50%;
        }
        /*/////////////////////////////////*/
        .box{
            width: 450px;height: 400px;

        }
        .big-box{
            width: 490px;height: 350px;overflow: hidden;border: 1px solid white;float: left;margin: 5px auto;
        }
        .big-box img{
            width: 490px;height: 350px;
        }

        .small-box a{float: left;width: 25%;height:100px;}
        .small-box img{
            padding: 10px;height:100px;width: 120px;
        }
        /*/////////////////////////////////////*/
        .desc{margin-left: 80px;padding-top: 10px;width: 35%;}
        .desc a{
            line-height: 50px;
        }
        .desc span{
            padding: 3px;border: 1px solid gainsboro;cursor: pointer;
        }
        .review tr{height: 120px;}
        .review img{
            width: 50px;height: 50px;
        }
        .footer{
            width: 100%;height: 200px;background: ghostwhite;padding-top: 20px;margin-top: 40px;color: gray;
        }
    </style>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="../kindeditor-4.1.10/kindeditor-min.js"></script>
    <script type="text/javascript" src="../kindeditor-4.1.10/lang/zh_CN.js"></script>
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
            <div class="col-8">
                <form class="form-inline" style="width: 90%;height: 50px;margin-left: 0px;" action="/jsp/searchBook.do">
                    <input class="form-control" name="name" type="text" placeholder="输入图书名称" style="width: 75%;height: 100%;border-radius: 0px">
                    <button class="btn btn-success" type="button" style="width: 15%;border-radius: 0px;height: 100%;font-size: 20px">搜索</button>
                </form>
            </div>
        </div>
    </div>
</div>

<nav class="navbar-nav navbar-expand-sm navbar-light" style="background: ghostwhite;color: gray;border-top: 2px solid orangered;padding-top: 8px;padding-bottom: 8px;">
    <div class="container">
        <a><span>MYMall></span><span>商品描述</span></a>
    </div>
</nav>

<div class="container" style="margin-top: 20px;">

    <div class="row">
        <div >
            <div class="card" style="width:500px;">

                <div class="big-box">
                    <img src="${book.mainImage}" id="mn1"/>
                    <img src="${book.img2}" id="mn2"/>
                    <img src="${book.img3}" id="mn3"/>
                    <img src="${book.img4}" id="mn4"/>
                </div>
                <div class="small-box">
                    <a href="#mn1"><img src="${book.mainImage}"></a>
                    <a href="#mn2"><img src="${book.img2}"></a>
                    <a href="#mn3"><img src="${book.img3}"></a>
                    <a href="#mn4"><img src="${book.img4}"></a>
                </div>

            </div>
            <br>
        </div>

        <div class="desc">
            <h3>${book.name}</h3>
            <a style="display: none" id="id">${book.id}</a>
            <a>作者：李白</a><br><a> ${book.subtitle}</a> <br>
            <a>价格:<span style="font-size: 25px;font-family:'微软雅黑'; color: red;">￥${book.price}</span></a><br>
            <a>库存:${book.stock}</a>
            <a>运费	包邮</a> <br>
            <a>数量:</a>
            <input type="button" id="sub" value="-"><input type="text" size="2" id="num" value="1" readonly="readonly"><input type="button" id="add" value="+">
            <br>

            <button type="button" class="btn add">加入购物车</button>
        </div>

    </div>

    <div class="row">

        <div class="container">
            <div class="">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#home">图书详情</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu1">图书评价</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div id="home" class="container tab-pane active"><br>

                        <ul>
                            <li>出版社：万卷</li>
                            <li>ISBN：9787547035184</li>
                            <li>作者：编者:大唐文化//木头人儿童创想中心</li>
                            <li>出版日期：2015-10-01</li>
                            <img src="img/miao/index/banner_img.jpg"><br>
                            <img src="img/miao/index/book-show.PNG"><br>
                            <img src="img/miao/index/book-show2.PNG"><br>
                            <img src="img/miao/index/book-show3.PNG">
                        </ul>

                        <p>本书共分四卷，内容涵盖政治、军事、科技、文化、经济、艺术、民族、法律、外交、教育等诸多方面，既有古往今来极具影响力的历史人物和事件，也有为人们所津津乐道的民间传说与故事，还对各个历史重大发明、发现做了详实的介绍，从盘古开天辟地一直讲到新中国成立，用活泼的语言和生动的漫画将中华悠悠五千年的文明历史鲜活地重现在小读者的面前。</p>
                    </div>
                    <div id="menu1" class="container tab-pane fade"><br>
                        <h3></h3>
                        <table class="table review">
                            <c:forEach items="${page.list}" var="list">
                                <tr>
                                    <td id="i" style="display: none;">${list.id}</td>
                                    <td><img src="${list.img}"><br><span>${list.username}</span></td>
                                    <td><a>${list.content}</a></td>
                                    <td>${list.time}</td>
                                </tr>
                            </c:forEach>
                        </table>

                        <div class="">

                        </div>

                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#h">发表评论</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="h" class="container tab-pane active"><br>
                                <form action="" id="contents">
                                   <textarea name="content" id="content" value="" style="visibility:hidden;height: 400px;width: 100%;margin: 0 auto;" >
                                   </textarea>
                                    <button class="btn" id="review" type="submit" style="background: #C60023;color: white;margin:10px;float: right;margin-right: 1px;">发表评论</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
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

    $("#add").click(function(){
        var n = document.getElementById("num");
        var x=0;
        x=parseInt(n.value)+1;
        n.value=x;
    })


    $("#sub").click(function(){
        var n = document.getElementById("num");
        var x=0;
        x=parseInt(n.value)-1;
        if(x<=1)
        {
            x=1;
        }
        n.value=x;
    })

    $(".add").click(function(){

        var id=$("#id").html();
        var num=$("#num").val();
        // alert(id);
        $.ajax({
            type:"post",
            url:"/jsp/add.do?id="+id+"&quantity="+num,
            async:true,
            success:function(data)
            {
                if (data.msg=="成功")
                {
                    window.location.href="/jsp/toAddSuccess.do";
                }
                else
                {
                    alert(data.msg);
                }
            }
        });
    })

    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="content"]', {
            uploadJson : '../kindeditor-4.1.10/jsp/upload_json.jsp',
            fileManagerJson : '../kindeditor-4.1.10/jsp/file_manager_json.jsp',
            allowFileManager : true,
            items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']

        });
    });

    $("#review").click(function(event){
        event.preventDefault();
        var bId=$("#id").html();
        $.ajax({
            type:"post",
            data:$("#contents").serialize(),
            url:"/jsp/review.do?bId="+bId,
            async:true,
            success:function (data) {
                if (data.msg=="评论成功")
                {
                    alert(data.msg);
                }else
                {
                    alert(data.msg);
                }
            }
        });

    })



</script>
</html>
