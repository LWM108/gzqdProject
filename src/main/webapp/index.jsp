<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="admin/css/pearForm.css" />
		<link rel="stylesheet" href="component/layui/css/layui.css" />
		<link rel="stylesheet" href="admin/css/pearButton.css" />
		<style>
			.layui-form{width: 330px;margin: auto;margin-top: 160px;}
			.layui-form button{width: 100%;height: 44px;line-height: 44px;font-size: 16px;font-weight: 550;}
			.layui-form-checked[lay-skin=primary] i {border-color: #2D8CF0 !important;background-color: #2D8CF0;color: #fff;}
			.layui-tab-content{margin-top: 15px;padding-left: 0px;padding-right: 0px;}
			.layui-form-item{margin-top: 20px;}
			.layui-input{height: 44px;line-height: 44px;padding-left: 15px;border-radius: 3px;}
			.layui-input:focus{box-shadow: 0px 0px 3px 1px #2D8CF0!important;}
			.logo{width: 60px;margin-top: 10px;margin-bottom: 10px;margin-left:20px;}
			.title{font-size: 30px;font-weight: 550;margin-left: 20px;color: #2D8CF0 !important;display: inline-block;height: 60px;line-height: 60px;margin-top: 10px;position: absolute;}
			.desc{width: 100%;text-align: center;color: gray;height: 60px;line-height: 60px;}
		</style>
	</head>
	<body background="admin/images/background.svg">
	    <form class="layui-form" action="javascript:void(0);">
			<div class="layui-form-item">
				<img class="logo" src="admin/images/logo.png" />
				<div class="title">Pear Admin</div>
				<div class="desc">
					高 新 区 最 具 影 响 力 的 设 计 规 范 之 一
				</div>
			</div>
            <div class="layui-form-item">
				<input placeholder="账 户 : admin" hover class="layui-input" />
			</div>
			<div class="layui-form-item">
				<input placeholder="密 码 : 888888" hover class="layui-input" />
			</div>
			<div class="layui-form-item">
				<input placeholder="验证码" hover class="layui-input layui-input-inline" style="width: 50%;display: inline-block!important;"/>
				<img src="https://yun.reg.163.com/urscloud/captcha?type=captcha_pwd&1568683587149" style="border-radius:3px;border: 1px #e6e6e6 solid;height: 100%;width: 45%;display: inline-block!important;height: 42px;" />
			</div>
			<div class="layui-form-item">
				<input type="checkbox" name="" title="记住密码" lay-skin="primary" checked>
			</div>
            <div class="layui-form-item">
				<button class="pear-btn pear-btn-primary login">
					登 入 
				</button>
			</div>
		</form>
		<script src="component/layui/layui.js"></script>
		<script>
			layui.use(['form', 'element','jquery'], function() {
				var from = layui.form;
				var element = layui.element;
				var $ = layui.jquery;
				
				$("body").on("click",".login",function(){
					
					location.href="index.html"
				})
			})
		</script>
	</body>
</html>
