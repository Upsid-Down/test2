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
    <script src="<%=basePath %>/static/js/bootstrap/jquery.min.js"></script>
    <title>new jsp</title>
</head>
<body>
<center>
    <h1>添加专业</h1>
    <form>
        <table width="600px" border="1px" cellpadding="1">
            <tr>
                <td>专业名称</td>
                <td><input type="text" name="mname" value=""></td>
            </tr>
            <tr>
                <td>学分</td>
                <td><input type="text" name="credlit" value=""></td>
            </tr>
            <tr>
                <td>毕业年限</td>
                <td><input type="text" name="LifeYear" value=""></td>
            </tr>
            <tr>
                <td>专业介绍</td>
                <td><textarea name="introduction" cols="30" rows="10"></textarea></td>
            </tr>
            <tr>
                <td>学院名称</td>
                <td>
                    <select name="cid">
                        <c:forEach items="${list}" var="list">
                            <option value="${list.cid}">${list.cname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" onclick="sbm()" value="提交"><input type="reset" value="重置"></td>
             </tr>
    </table>
    </form>
</center>
    <script type="text/javascript">
      function sbm() {
          var b = confirm("确定提交吗");
          if (b) {
              $.ajax({
                  url:"<%=basePath %>/major/addMajor.do",
                  type:"post",
                  datatype:"JSON",
                  data:{
                      "mname": $("input[name='mname']").val(),
                      "credlit": $("input[name='credlit']").val(),
                      "LifeYear":$("input[name='LifeYear']").val(),
                      "introduction": $("textarea[name='introduction']").val(),
                      "cid": $("select option:selected").val()
                  },
                  success: function (rs) {
                      if (rs) {
                          alert("添加成功,5秒后跳转至首页");
                          setTimeout("window.open('<%=basePath %>/major/getAllMajor.do','_self')",5000)
                      } else {
                          alert("添加失败")
                      }
                  },
                  error:function () {
                      alert("出错了")
                  }
              })
          }

      }
    </script>
</body>
</html>
