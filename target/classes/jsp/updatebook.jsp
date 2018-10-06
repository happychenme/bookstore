<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;">
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
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
</head>

<body>
<div class="container">
    <div class="head">
        <a style="float: left;font-size: 28px;font-family: '微软雅黑';">图书管理--添加/修改图书</a>
    </div>
    <br>
    <form class="" id="addBook">
        <div class="form-inline">
            <label class="w-25">图书名称:</label>
            <input type="text" class="form-control w-50"  placeholder="输入书名" name="name" value="${book.name}">
        </div>
        <div class="form-inline">
            <label class="w-25">图书描述:</label>
            <input type="text" class="form-control w-50"  placeholder="图书描述" name="subtitle" value="${book.subtitle}">
        </div>
        <div class="form-inline">
            <label for="sel1" class="w-25">所属分类:</label>
            <select class="form-control w-25" id="sel1" name="categoryId" style="margin-right: 20px;">
                <option value="0" selectd="selectd">选择分类</option>
                <c:forEach items="${list}" var="list">
                    <option selectd="selectd" value="${list.id}">${list.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-inline">
            <label for="sel1" class="w-25">图书价格:</label>
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="图书价格" name="price" value="${book.price}">
                <div class="input-group-append">
                    <span class="input-group-text">元</span>
                </div>
            </div>
        </div>
        <div class="form-inline">
            <label for="sel1" class="w-25">图书库存:</label>
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="图书库存" name="stock" value="${book.stock}">
                <div class="input-group-append">
                    <span class="input-group-text">件</span>
                </div>
            </div>
        </div>
        <div class="form-inline">
            <label for="sel1" class="w-25">图书图片:</label>
            <div class="w-75" style="">
                <%--<input type="file" style="line-height: 30px;width: 15%;"  name="subImages">--%>
                <input type="file" style="line-height: 30px;width: 15%;" onchange="uploadImg()" id="img" name="img">
                <input type="hidden" name="subImages" id="avatar">
                <p></p>
                <%--<img src="" alt="" id="avatarShow" width="50px" height="50px">--%>
            </div>
        </div>
        <div class="form-inline">
            <label for="sel1" class="w-25">图书详情:</label>
            <div class="w-75">
                        <textarea name="detail" id="detail" value="${book.detail}"
                                  style="visibility:hidden;height: 300px;width: 700px;" >
                        </textarea>
            </div>
        </div>
        <button type="submit" style="margin-left: 10%;margin-top: 2px;width: 80px;" class="btn" id="btn">提交</button>
    </form>
</div>
</body>

<script>

    function uploadImg() {
        $.ajaxFileUpload({
            type: "POST",
            url:"/jsp/upload.do",
            dataType: "json",
            fileElementId:"img",  // 文件的id
            success: function(d){

                if(d.status == 0) {
                    //alert("上传成功");
                    //图片显示
                    if ($("#avatar").val()==null || $("#avatar").val()=="")
                    {
                        $("#avatar").attr("value",d.data.url);
                        $("p").append("<img src="+d.data.url+" width='50px' height='50px'>");
                    }
                    else
                    {
                        var str=$("#avatar").val();
                        $("#avatar").attr("value",str+","+d.data.url);
                        $("p").append("<img src="+d.data.url+"  width='50px' height='50px'>"+"&nbsp;&nbsp;");
                    }

                }
            },
            // error: function (d) {
            //     alert("上传失败");
            // },
        });
    }

    $("#btn").off().click(function(event){
        event.preventDefault();
        $.ajax({
            type:"post",
            url:"/jsp/UpdateBook.do",
            data:$("#addBook").serialize(),
            async:true,
            success:function(data){
                alert(data.msg);
            }
        });
    })

    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="detail"]', {

        });
    });


</script>

</html>