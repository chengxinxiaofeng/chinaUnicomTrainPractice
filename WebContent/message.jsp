<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>中国联通OA系统</title>
     <!-- layui -->
    <link href="static/layui-v2.5.4/layui/css/layui.css" rel="stylesheet">
    <!-- jquery -->
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <!-- layer -->
    <script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
    <!-- layui -->
    <script src="static/layui-v2.5.4/layui/layui.js"></script>
	<style>
		tr:nth-child(even) {
		     background:#D3D3D3;
		}
	</style>
</head>
<body>
	  <div class="layui-form-item" style="float:right;top:0px;margin-top:0px">
    	<div class="layui-input-block">
      		<button class="layui-btn layui-btn-danger" id="loginOut" onclick="logout()"> 退出登录</button>
  	   </div>
      </div>
	<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
	  	  <legend>提交留言</legend>
		  <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">留言人</label>
		      <div class="layui-input-inline">
		        <input type="tel" name="phone"  id="username" autocomplete="off" class="layui-input" value = "<%=session.getAttribute("username")%>">
		      </div>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">标题</label>
		      <div class="layui-input-inline">
		        <input type="tel" name="phone"  autocomplete="off" class="layui-input" id="title">
		      </div>
		    </div>
		  </div>
		   <div class="layui-form-item layui-form-text" style="width:70%">
		    <label class="layui-form-label">内容</label>
		    <div class="layui-input-block">
		      <textarea placeholder="请输入内容" class="layui-textarea" id="content"></textarea>
		    </div>
		  </div>
		  <div class="layui-form-item">
	    	<div class="layui-input-block">
	      		<button class="layui-btn" id="submit">提交</button>
	  	   </div>
	      </div>
	</fieldset> 
	<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
	  	 <legend>留言列表</legend> 
		 <table class="layui-hide" id="test"></table>
	</fieldset>
<script>
	//渲染留言数据
	getMessageList();
	//提交留言处理
	$("#submit").click(function(){
		if( $("#username").val() == ""){
			  $("#username").focus(); 
			  layer.msg('请输入用户名');
			  return;
		}else if( $("#title").val() == ""){
			  $("#title").focus(); 
			  layer.msg('请输入标题');
			  return;
		}else if( $("#content").val() == ""){
			  $("#content").focus(); 
			  layer.msg('请输入内容');
			  return;
		}
		
		$.post("<%=request.getContextPath()%>/submitMessage", {
			"username" : $("#username").val(),
			"title" : $("#content").val(),
			"content" : $("#content").val()
		}, function(result) {
			getMessageList();
		});
	});   
	
	//渲染留言数据
    function getMessageList(){
        layui.use('table', function(){
      	  var table = layui.table;
      	  table.render({
      	    elem: '#test'
      	    ,url:'<%=request.getContextPath()%>/getMessageList'
      	    ,cols: [[
      	       {field:'username', title: '留言人', sort: true}
      	      ,{field:'title', title: '标题', sort: true}
      	      ,{field:'username', title: '内容', sort: true}
      	    ,{field:'createTime', title: '留言时间', sort: true}
      	    ]]
      	    ,page: false
      	  });
      });
    }
	
	//退出登录
	function logout(){
		$.post("<%=request.getContextPath()%>/logout", {},
			function(result) {
			layer.msg('退出成功');
			window.location.href="login.jsp";
		});
	}
</script>
</body>
</html>