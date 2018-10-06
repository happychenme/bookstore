<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>登录</title>
    <style type="text/css">
        #register .form-inline{
            height:30px;
        }
    </style>>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
</head>


<body style="background: #202E3C;">

<div class="card" style="width: 500px;height: 300px;margin: 200px auto;font-family: '微软雅黑';background: #2E3F4F;">

    <div class="card-body" style="padding: 10%;box-sizing: border-box;">
        <h4 style="text-align: center;">登陆</h4>
        <form action="" method="post" id="login">
            <div class="form-group">
                <input type="text" class="form-control" name="username"  placeholder="用户名:">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" id="pwd" placeholder="密码:">
            </div>
            <div class="">
                <a href="" style="float: left;color: gray;">忘记密码?</a>
                <a style="float: right;color: black;margin-right: 1px;cursor: pointer;color: gray;" data-toggle="modal" data-target="#myModal1">注册</a>
            </div>
            <button type="submit" class="btn w-100 login" style="margin: 12px auto;">登录</button>
        </form>

    </div>
</div>

<!--
          作者：275905928@qq.com
          时间：2018-08-31
          描述：用户注册模态框
      -->
<div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">注册</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <form  action="" id="register" method="post">
                    <div class="form-inline">
                        <label for="name" class="w-25">用户名:</label>
                        <input type="text" class="form-control w-50" id="name" name="username" placeholder="输入用户名">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <label for="password" class="w-25"> 头像:</label>
                        <input type="file" style="line-height: 30px;width: 15%;" onchange="uploadImg()" id="img"  name="img">
                        <input type="hidden" name="img" id="avatar">
                        <img src="" alt="" id="avatarShow" width="50px" height="50px">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <label for="password" class="w-25"> 密 码:</label>
                        <input type="password" class="form-control w-50" id="password" name="password" placeholder="输入注册密码">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <label for="repwd" class="w-25"> 确认密 码:</label>
                        <input type="password" class="form-control w-50" id="repwd" name="repwd" placeholder="重复输入注册密码">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <label  class="w-25">电话:</label>
                        <input type="text" class="form-control w-50"  name="phone" placeholder="输入电话">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <label  class="w-25"> 邮箱:</label>
                        <input type="text" class="form-control w-50"  name="email" placeholder="输入邮箱">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <label class="w-25">问题:</label>
                        <input type="text" class="form-control w-50"  name="question" placeholder="输入密码提示问题">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <label class="w-25"> 答案:</label>
                        <input type="text" class="form-control w-50"  name="answer" placeholder="输入密码提示答案">
                    </div>
                    <br/>
                    <div class="form-inline">
                        <a class="w-25"></a>
                        <button type="submit" class="btn w-50 register">注册</button>
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

    function uploadImg() {
        if($("#file").val() != "") {
            $.ajaxFileUpload({
                type: "POST",
                url:"/jsp/uploadFile.do",
                dataType: "json",
                fileElementId:"img",  // 文件的id
                success: function(d){
                    if(d.status == 0) {
                        //alert("上传成功");
                        //图片显示
                        $("#avatar").attr("value",d.msg);
                        $("#avatarShow").attr("src",d.msg);
                    }
                },
                error: function () {
                    alert("上传失败");
                },
            });
        } else {
            alert("请先选择文件");
        }
    }

    $(".login").click(function(event){
        event.preventDefault();
        $.ajax({
            type:"post",
            data:$("#login").serialize(),
            url:"/jsp/check.do",
            async:true,
            success:function(data){
                alert(data.msg);
                if (data.msg=='用户登录成功')
                {
                    window.location.href='jsp/list.do';
                }
                else if(data.msg=="管理员登录成功")
                {
                    window.location.href='jsp/back.jsp';
                }
                else
                {
                    alert(data.msg);
                }
            }
        });
    })

    $(".register").click(function(event){
        event.preventDefault();
        $.ajax({
            type:"post",
            data:$("#register").serialize(),
            url:"/jsp/register.do",
            async:true,
            success:function(data){
                alert(data.msg);
            }
        });
    })

</script>
</html>