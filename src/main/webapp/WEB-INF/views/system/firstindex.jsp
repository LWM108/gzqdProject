<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Pear Admin  http://jmysy.gitee.io/pear-admin-layui/Pear%20Admin%20v%202.0/#-->
<!-- 增加gitee  跟 github内容更新 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${ APP_PATH}/static/component/layui/css/layui.css" />
	    <link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearTab.css" />
		<link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearTheme.css" />
		<link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearLoad.css" />
		<link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearFrame.css" />
		<link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearAdmin.css" />
		<link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearNotice.css" />
		<link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearSocial.css" />
	    <link rel="stylesheet" href="${ APP_PATH}/static/admin/css/pearMenu.css" />
		<style id="pearone-bg-color"></style>
	</head>
	
	<body class="layui-layout-body  pear-admin">
		<!-- 布局框架 -->
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<ul class="layui-nav layui-layout-left">
					<li class="collaspe layui-nav-item"><a href="#" class="layui-icon layui-icon-shrink-right"></a></li>
					<li class="refresh layui-nav-item"><a href="#" class="layui-icon layui-icon-refresh-1"></a></li>
				</ul>
				<div id="control" class="layui-layout-control"></div>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item layui-hide-xs"><a href="#" class="fullScreen layui-icon layui-icon-screen-full"></a></li>
					<li class="layui-nav-item layui-hide-xs"><a href="https://gitee.com/Jmysy/Pear-Admin-Layui" class="layui-icon layui-icon-website"></a></li>
					<li class="layui-nav-item layui-hide-xs" id="headerNotice"></li>
					<li class="layui-nav-item" lay-unselect="">
						<a href="javascript:;"><img src="${ APP_PATH}/static/admin/images/avatar.jpg" class="layui-nav-img">就眠仪式</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;" class="pearson">个人信息</a></dd>
							<dd><a href="javascript:;">安全配置</a></dd>
							<dd><a href="javascript:;">打开百度</a></dd>
							<dd><a href="javascript:;">注销登陆</a></dd>
						</dl>
					</li>
					<li class="setting layui-nav-item"><a href="#" class="layui-icon layui-icon-more-vertical"></a></li>
				</ul>
			</div>
			<div class="layui-side layui-bg-black">
				<div class="layui-logo">
					<img class="logo" src="${ APP_PATH}/static/admin/images/logo.png" />
					<span class="title">Pear Admin</span>
				</div>
				<div class="layui-side-scroll">
					<div id="sideMenu">1</div>
				</div>
			</div>
			<div class="layui-body">
				<div id="content">1</div>
			</div>
		</div>

		<!-- 移动端 遮盖层 -->
		<div class="pear-cover"></div>

		<!-- 初始加载 动画-->
		<div class="preloader">
			<div class="preloader-inner"></div>
		</div>

		<script src="${ APP_PATH}/static/component/layui/layui.js"></script>
		<script>
			layui.use(['pearAdmin', 'jquery', 'pearTab', 'pearNotice'], function() {
				var pearAdmin = layui.pearAdmin;
				var $ = layui.jquery;
				var pearTab = layui.pearTab;
				var pearNotice = layui.pearNotice;

				var config = {
					keepLoad: 1200, // 主 页 加 载 过 度 时 长 可为 false
					muiltTab: true , // 是 否 开 启 多 标 签 页 true 开启 false 关闭
					control: false, // 是 否 开 启 多 系 统 菜 单 true 开启 false 关闭
					theme: "dark-theme", // 默 认 主 题 样 式 dark-theme 默认主题 light-theme 亮主题
					index: 'index', // 默 认 加 载 主 页      '${ APP_PATH}/console/console1.jsp'
					data: '${ APP_PATH}/static/admin/data/menu.json', // 菜 单 数 据 加 载 地 址
				};
				
				pearAdmin.render(config);
				
				/**
				 * 消 息 初 始 化
				 * */
				pearNotice.render({
					elem: 'headerNotice',
					url:  '${ APP_PATH}/static/admin/data/notice.json',
					height: '200px',
					click: function(id, title) {
						layer.msg("当前监听消息" + id + "消息标题:" + title);
					}
				})
				
		 
// 				"${ APP_PATH}/system/person.jsp"
				$("body").on("click",".pearson",function(){
					pearTab.addTabOnlyByElem("content"
					,{id:111,title:"个人信息"
					,url: "systemPerson"
					,close:true})
				})
				
			})
		</script>
	</body>
</html>
