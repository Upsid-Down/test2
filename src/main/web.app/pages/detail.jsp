<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>详情页</title>
</head>
<body>
<center>
    <table width="600px" border="1px">
        <tr>
            <td>专业名称</td>
            <td>${byMid.mname}</td>
        </tr>
        <tr>
            <td>学分</td>
            <td>${byMid.credlit}</td>
        </tr>
        <tr>
            <td>毕业年限</td>
            <td>${byMid.LifeYear}</td>
        </tr>
        <tr>
            <td>专业介绍</td>
            <td>${byMid.introduction}</td>
        </tr>
        <tr>
            <td>院校</td>
            <td>${byMid.cname}</td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" value="返回" onclick="window.close()"></td>
        </tr>
    </table>
</center>

</body>
</html>
