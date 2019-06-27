<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>中国联通OA系统</title>

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 <!--    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- jquery -->
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <!-- layer -->
    <script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
	<style>
	
	body{
		    background: url("static/img/1.png")  no-repeat;
		    width:100%;  
		    height:100%;  
		    background-size:100% 100%;  
	        background-attachment: fixed;
		    margin:0;padding:0;
		}
		.form{
			background: rgba(255,255,255,0.2);
			width:400px;
			margin:120px auto;
		}
	/*阴影*/
		.fa{
			display: inline-block;
			top: 27px;
			left: 6px;
			position:
			relative;
			color:
			#ccc;
		}
		input[type="text"],input[type="password"]{
			padding-left:26px;
		}
	
	</style>


</head>
<body>
    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">用户登录</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="用户名" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="密码" id="pwd" name="password" maxlength="8"/>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button id="submit" type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
	var isLogin = <%=session.getAttribute("isLogin")%>;
	if(isLogin==true){
		//加载层
		var index = layer.load(1, {shade: false}); //0代表加载的风格，支持0-2
		//loading层
		var index = layer.load(2, {
		  shade: [0.1,'#D3D3D3'] //0.1透明度的白色背景
		});
	    setInterval(toMessage, 3000);
		layer.msg('您已登录，将在3秒后自动登录...');
	}
    function toMessage(){
    	 window.location.href="message.jsp" 
    }
    
    $("#submit").click(function(){
    	if( $("#username").val() == ""){
    		  $("#username").focus(); 
    		  layer.msg('请输入用户名');
    		  return;
    	}else if( $("#pwd").val() == ""){
    		  $("#pwd").focus(); 
    		  layer.msg('请输入密码');
    		  return;
    	}
    	
		$.post("<%=request.getContextPath()%>/login", {
			"username" : $("#username").val(),
			"pwd" : $("#pwd").val()
		}, function(result) {
			var obj = JSON.parse(result);
			if(obj.isSuccess == 200){
				layer.msg('登录成功');
				window.location.href="message.jsp" 
			}else{
				$("#username").focus(); 
				layer.msg('账号或密码错误');
			}
			
		});
    }); 
    </script>
</body>
</html>