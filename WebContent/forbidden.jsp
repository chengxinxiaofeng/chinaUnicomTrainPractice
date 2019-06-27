<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>没有权限</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
        <!-- layer -->
    <script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
	<style>
	
	body{
		    background: url("static/img/forbidden.png")  no-repeat;
		    width:100%;  
		    height:100%;  
		    background-size:100% 100%;  
	        background-attachment: fixed;
		    margin:0;padding:0;
		}
	
	</style>


</head>
<body>
    <script>
    setInterval(toLogin, 5000);
	layer.msg('您没有权限访问该资源！将在5秒后跳转至登录页面...');
    function toLogin(){
    	 window.location.href="login.jsp" 
    }
    </script>
</body>
</html>