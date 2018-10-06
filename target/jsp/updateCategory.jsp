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
        .form-inline{
            line-height: 50px;
        }
        .form-inline label{
            font-family: "微软雅黑";font-size: 20px;font-weight: 500;
        }
        .head{
            width: 100%;height: 70px;border-bottom: 1px solid gainsboro;line-height: 70px;
        }
    </style>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="../kindeditor-4.1.10/kindeditor-min.js"></script>
    <script type="text/javascript" src="../kindeditor-4.1.10/lang/zh_CN.js"></script>
</head>

<body>
<div class="container">
    <div class="head">
        <a style="float: left;font-size: 28px;font-family: '微软雅黑';">图书管理--添加/修改分类</a>
    </div>
    <br>
    <form id="updateCategory">
        <div class="form-inline">
            <label class="w-25">分类名称:</label>
            <input type="text" name="name" class="form-control w-50" required="required" value="${requestScope.name}"  placeholder="输入分类名称">
        </div>
        <div class="form-inline">
            <label for="sel1" class="w-25">所属分类:</label>
            <select class="form-control w-25" id="sel1" name="parentId" style="margin-right: 20px;">
                <option value="0" selectd="selectd">选择分类</option>
                <c:forEach items="${list}" var="list">
                    <option selectd="selectd" value="${list.id}">${list.name}</option>
                </c:forEach>
            </select>
        </div>
        <button type="button" id="btn" style="margin-left: 10%;margin-top: 2px;width: 80px;" class="btn">提交</button>

    </form>
</div>
</body>

<script>

    $("#btn").click(function(){
        $.ajax({
            type:"post",
            data:$("#updateCategory").serialize(),
            url:"/jsp/updateCategory.do",
            async:true,
            success:function(data){
                alert(data.msg);
            }
        });
    })


</script>

</html>