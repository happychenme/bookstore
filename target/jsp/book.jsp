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
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
</head>

<body>
        <div class="container">
            <div class="head">
                <a style="float: left;font-size: 28px;font-family: '微软雅黑';">图书管理</a>
                <a href="/jsp/toupdatebook.do" class="btn btn-info" role="button" style="float: right;margin-top: 20px;">添加图书</a>
            </div>
            <div class="input-group mb-3" style="margin-top: 20px;margin-left: 15%;">
                <form class="form-inline" style="width: 60%;" action="/jsp/findCategoryByName.do">
                    <input class="form-control" name="name" type="text" placeholder="输入图书名称" style="width: 45%">
                    <button class="btn btn-success" type="submit" style="width: 15%;border-radius: 0px;">搜索</button>
                </form>
            </div>
            <table class="table table-bordered table-striped" id="table">
                <thead>
                <tr>
                    <th>id</th>
                    <th>书名</th>
                    <th>价格</th>
                    <th>库存</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <c:forEach items="${page.list}" var="page">
                    <tr>
                        <td>${page.id}</td>
                        <td>${page.name}</td>
                        <td>${page.price}</td>
                        <td>${page.stock}</td>
                        <td>${page.status}</td>
                        <td>
                            <input type="button" class="btn delete" value="删除"/>
                            <input type="button" class="btn update" value="编辑"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="">
                <ul class="pagination float-lg-right">
                    <li class="page-item"><a class="page-link" href="/jsp/bookList.do?pageNum=1">首页</a></li>
                    <li class="page-item">
                        <c:if test="${page.hasPreviousPage}">
                            <a class="page-link" href="/jsp/bookList.do?pageNum=${page.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </c:if>
                    </li class="page-item">
                    <c:forEach items="${page.navigatepageNums}" var="page_num">
                        <c:if test="${page_num == pageInfo.pageNum}">
                            <li class="active page-item"><a page-link href="/jsp/bookList.do?pageNum=${page_num}">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num != page.pageNum}">
                            <li class="page-item"><a class="page-link" href="/jsp/bookList.do?pageNum=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <li class="page-item">
                        <c:if test="${page.hasNextPage}">
                            <a class="page-link" href="/jsp/bookList.do?pageNum=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </c:if>
                    </li>
                    <li class="page-item"><a class="page-link" href="/jsp/bookList.do?pageNum=${page.pages}">尾页</a></li>
                </ul>
            </div>

        </div>
</body>
<script>

    $("#table").on("click",".delete",function(){
        var id=$(this).parents("tr").find("td").eq(0).html();
        var _that=$(this);
        $.ajax({
            type:"post",
            url:"/jsp/deleteBook.do?id="+id,
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
//感觉自己在瞎弄瞎弄
    $("#table").on("click",".update",function(){
        var id=$(this).parents("tr").find("td").eq(0).html();
        $.ajax({
            type:"post",
            url:"/jsp/toUpdateBook.do?id="+id,
            async:true,
            success:function(){
                window.location.href="/jsp/toUpdateBook.do?id="+id;
            }
        });
    })

</script>
</html>
