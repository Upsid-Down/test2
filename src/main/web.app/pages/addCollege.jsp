<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <script src="<%=basePath %>/static/js/bootstrap/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>new jsp</title>
</head>
<body>
<center>
    <form>
        <table width="600px" border="1px" cellpadding="1">
            <tr>
                <td>学院名称</td>
                <td><input type="text" name="cname" value=""></td>
            </tr>
            <tr>
                <td>学院地址</td>
                <td><input type="text" name="caddress" value=""></td>
            </tr>
            <tr>
                <td>创办时间</td>
                <td><input type="date" name="createtime" value="" ></td>
            </tr>
            <tr>
                <td>院徽</td>
                <td><input type="file" name="ooo" value=""></td>
            </tr>
            <tr>
                <td>学院简介</td>
                <td><input type="text" name="cpic" value=""></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="button" onclick="sbm()" value="提交">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</center>
<script type="text/javascript">
    function sbm() {
        var b = confirm("确定提交吗");
            if (b) {
                $.ajax({
                    url:"<%=basePath %>/major/addCollege.do",
                    type:"post",
                    dataType:"JSON",
                    data:{
                        "cname":$("input[name='cname']").val(),
                        "caddress":$("input[name='caddress']").val(),
                        "createtime": $("input[name='createtime']").val(),
                        "cpic": $("input[name='cpic']").val()
                    },
                    success:function (rs) {
                        if (rs) {
                            alert("添加成功");
                            window.close();
                            //刷新当前窗口的父窗口
                            window.opener.location.reload();
                        } else {
                            alert("添加失败")
                        }
                    },
                    error:function () {
                        alert("错误")
                    }
                })
        }
    }
</script>
</body>
</html>
