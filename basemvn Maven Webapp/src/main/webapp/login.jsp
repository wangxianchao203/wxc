<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
<script src="<%=basePath%>/static/js/jquery-1.8.1.min.js"></script>
</head>
<body>
username: <input type="text" id="username"><br><br>  
password: <input type="password" id="password"><br><br>
<button id="loginbtn">登录</button>
</body>
<script type="text/javascript">
$('#loginbtn').click(function() {
    var param = {
        username : $("#username").val(),
        password : $("#password").val()
    };
    $.ajax({ 
        type: "post", 
        url: "<%=basePath%>" + "/checkLogin.do",
        data: param, 
        dataType: "json", 
        success: function(data) { 
            if(data.success == false){
                alert(data.errorMsg);
            }else{
                //登录成功
                window.location.href = "success.do";
            }
        },
        error: function(data) { 
            alert(data+"调用失败...."); 
        }
    });
});
</script>
</html>