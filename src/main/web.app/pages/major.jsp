<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学院管理系统</title>
    <title>分页查询</title>
    <!-- 引入bootstrap分页 -->
    <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
    <script>
        $(function() {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage: ${requestScope.pageInfo.pageNum },
                totalPages: ${requestScope.pageInfo.pages },
                pageUrl: function(type, page, current) {
                    return '/major/getAllMajor.do?pageNum=' + page+'&mname=${map.mname}'+'&min=${map.min}'+'&max=${map.max}'+'&cname=${map.cname}';
                },
                itemTexts: function(type, page, current) {
                    switch(type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                }
            });
        });
    </script>
</head>
<body>
<center>
    <h1>学院管理系统</h1>
    <p>
        <a href="javascript:void(0)" onclick="addCollege()">添加学院信息</a>
        <a href="<%=basePath %>//major/getCollege.do">添加专业信息</a>
    </p>
    <p>
        <form action="<%=basePath%>/major/getAllMajor.do" method="post">
                学院名称<select name="cname">
                                <option value="">请选择</option>
                             <c:forEach items="${majordb}" var="db">
                                 <option value="${db.cname}"
                                         <c:if test="${db.cname==cname}">selected</c:if>
                                 >${db.cname}</option>

                             </c:forEach>
                        </select>
                专业名称<input type="text" name="mname" value="${map.mname}">
                学分<input type="text" name="min" value="${map.min}">----<input type="text" name="max" value="${map.max}">
                <input type="submit" value="查询"><input type="reset" value="重置">
        </form>
    </p>
    <table width="800px" border="2px" cellpadding="5">
        <thead>
            <tr>
                <th>专业编号</th>
                <th>专业名称</th>
                <th>学制</th>
                <th>学分</th>
                <th>学院名称</th>
                <th>删除</th>
                <th>详情</th>
                <th>修改</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pageInfo.list}" var="list">
                <tr>
                    <td>${list.mid}</td>
                    <td>${list.mname}</td>
                    <td>${list.LifeYear}</td>
                    <td>${list.credlit}</td>
                    <td>${list.cname}</td>
                    <td><a href="javascript:void(0)" onclick="del(${list.mid})" >删除</a></td>
                    <td><a href="javascript:void(0)" onclick="detailInfo(${list.mid})">详情</a></td>
                    <td><a href="javascript:void(0)">修改</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- 把分页搞出来 -->
    <ul id="pagination"></ul>
</center>
    <script type="text/javascript">
        //添加学院
     function addCollege() {
            window.open("<%=basePath %>/pages/addCollege.jsp","","width=800,height=400,top=100,left=300");
     }
        //添加专业
      /*  function addMajor() {
            window.open("<%=basePath %>/","","width=800,height=400,top=100,left=300");
        }*/


        //删除
        function del(mid) {
            var b = confirm("确定删除吗");
           if (b) {
                $.ajax({
                    url:"<%=basePath %>/major/delByMid.do",
                    type:"post",
                    dateType:"JSON",
                    data:{
                        "mid":mid
                    },
                    success:function (result) {
                        if (result) {
                            alert("删除成功");
                            window.open("<%=basePath %>/major/getAllMajor.do","_self")
                        }else {
                            alert("删除失败")
                        }
                    },
                    error:function () {
                        alert("出错了")
                    }
                })
            }

        }
        
        //详情
        function detailInfo(mid) {
            window.open("<%=basePath %>/major/getByMid.do?mid="+mid,"","width=800,height=400,top=100,left=300");
        }
    </script>
</body>
</html>
