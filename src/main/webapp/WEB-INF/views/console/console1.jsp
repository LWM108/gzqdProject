<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%
pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>首页三</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="${ APP_PATH}/static/admin/css/pearCommon.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ APP_PATH}/static/component/layui/css/layui.css" media="all">
		<style>
			.top-panel {
				border-radius: 4px;
				text-align: center;
			}

			.top-panel>.layui-card-body {
				height: 60px;
			}

			.top-panel-number {
				line-height: 60px;
				font-size: 30px;
				border-right: 1px solid #eceff9;
			}

			.top-panel-tips {
				padding-left: 8px;
				padding-top: 16px;
				line-height: 30px;
				font-size: 12px
			}

			.pear-container {
				background-color: whitesmoke;
				margin: 10px;
			}

			.card {
				width: 100%;
				height: 160px;
				background-color: whitesmoke;
				border-radius: 4px;
			}

			.card .header .avatar {
				width: 28px;
				height: 28px;
				margin: 20px;
				border-radius: 50px;
			}

			.card .header {
				color: dimgray;
			}

			.card .body {
				color: gray;
			}

			.card .body {
				margin-left: 20px;
				margin-right: 20px;
			}

			.card .footer {
				margin-left: 20px;
				margin-right: 20px;
				margin-top: 20px;
				font-size: 13px;
				color: gray;
				position: absolute;
			}

			.list .list-item {
				height: 33px;
				line-height: 33px;
				color: gray;
				padding: 5px;
				padding-left: 15px;
				border-radius: 4px;
				margin-top: 5.2px;
			}

			.custom-tab .layui-tab-title {
				border-bottom-width: 0px;
				border-bottom-style: none;
			}

			.custom-tab .layui-tab-title li {
				margin-left: 10px;
			}

			.list .list-item:hover {
				background-color: whitesmoke;
			}


			.list .list-item .title {
				font-size: 13px;
				width: 100%;
			}

			.list .list-item .footer {
				position: absolute;
				right: 30px;
				font-size: 12px;
			}

			.top-panel-tips i {

				font-size: 33px;
			}

			.layuiadmin-card-status {
				padding: 0 10px 10px;
			}

			.layuiadmin-card-status dd {
				padding: 15px 0;
				border-bottom: 1px solid #EEE;
				display: -webkit-flex;
				display: flex;
			}

			.layuiadmin-card-status dd div.layui-status-img,
			.layuiadmin-card-team .layui-team-img {
				width: 32px;
				height: 32px;
				border-radius: 50%;
				background-color: #009688;
				margin-right: 15px;
			}

			.layuiadmin-card-status dd div.layui-status-img a {
				width: 100%;
				height: 100%;
				display: inline-block;
				text-align: center;
				line-height: 32px;
			}

			.layuiadmin-card-status dd div span {
				color: #BBB;
			}
			.layuiadmin-card-status dd div a{
				color: #01AAED;
			}
		</style>
	</head>
	<body class="pear-container">
		<div>
			<div class="layui-row layui-col-space10">
				<div class="layui-col-xs6 layui-col-md3">
					<div class="layui-card top-panel">
						<div class="layui-card-header">今日访问</div>
						<div class="layui-card-body">
							<div class="layui-row layui-col-space5">
								<div class="layui-col-xs8 layui-col-md8 top-panel-number">
									9,04,0
								</div>
								<div class="layui-col-xs4 layui-col-md4 top-panel-tips">
									<i class="layui-icon layui-icon-app" style="color: #4099FF;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-md3">
					<div class="layui-card top-panel">
						<div class="layui-card-header">提交次数</div>
						<div class="layui-card-body">
							<div class="layui-row layui-col-space5">
								<div class="layui-col-xs8 layui-col-md8 top-panel-number">
									6,34,4
								</div>
								<div class="layui-col-xs4 layui-col-md4 top-panel-tips">
									<i class="layui-icon layui-icon-component" style="color: #DD4A68;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-md3">
					<div class="layui-card top-panel">
						<div class="layui-card-header">下载数量</div>
						<div class="layui-card-body">
							<div class="layui-row layui-col-space5">
								<div class="layui-col-xs8 layui-col-md8 top-panel-number">
									1,34,1
								</div>
								<div class="layui-col-xs4 layui-col-md4  top-panel-tips">
									<i class="layui-icon layui-icon-carousel" style="color: #5FB878;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-md3">
					<div class="layui-card top-panel">
						<div class="layui-card-header">流量统计</div>
						<div class="layui-card-body">
							<div class="layui-row layui-col-space5">
								<div class="layui-col-xs8 layui-col-md8 top-panel-number">
									7,04,6
								</div>
								<div class="layui-col-xs4 layui-col-md4 top-panel-tips">
									<i class="layui-icon layui-icon-cart" style="color: #E6A23C;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md9">
					<div class="layui-card">
						<div class="layui-card-body">
							<div class="layui-tab custom-tab layui-tab-brief" lay-filter="docDemoTabBrief">
								<div id="echarts-records" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
							</div>
						</div>
					</div>
					<div class="layui-card">
						<div class="layui-card-header">动态</div>
						<div class="layui-card-body">
							<dl class="layuiadmin-card-status">
								<dd>
									<div class="layui-status-img"><a href="javascript:;"><img style="width: 32px;height: 32px;border-radius: 50px;" src="${ APP_PATH}/static/admin/images/avatar.jpg"></a></div>
									<div>
										<p>七彩枫叶 在 <a lay-href="https://gitee.com/Jmysy/Pear-Admin-Layui">Pear Admin 专区</a> 回答问题</p>
										<span>几秒前</span>
									</div>
								</dd>
								<dd>
									<div class="layui-status-img"><a href="javascript:;"><img style="width: 32px;height: 32px;border-radius: 50px;" src="${ APP_PATH}/static/admin/images/avatar.jpg"></a></div>
									<div>
										<p>简 在 <a lay-href="https://gitee.com/Jmysy/Pear-Admin-Layui">Pear Admin 专区</a> 进行了 <a lay-href="http://fly.layui.com/vipclub/list/layuiadmin/column/quiz/">提问</a></p>
										<span>2天前</span>
									</div>
								</dd>
								<dd>
									<div class="layui-status-img"><a href="javascript:;"><img style="width: 32px;height: 32px;border-radius: 50px;" src="${ APP_PATH}/static/admin/images/avatar.jpg"></a></div>
									<div>
										<p>恒宇少年 将 <a lay-href="https://gitee.com/Jmysy/Pear-Admin-Layui">Pear Admin </a> 更新至 2.3.0 版本</p>
										<span>7天前</span>
									</div>
								</dd>
								<dd>
									<div class="layui-status-img"><a href="javascript:;"><img style="width: 32px;height: 32px;border-radius: 50px;" src="${ APP_PATH}/static/admin/images/avatar.jpg"></a></div>
									<div>
										<p>如花 在 <a lay-href="https://gitee.com/Jmysy/Pear-Admin-Layui">Pear Admin 社区</a> 发布了 <a lay-href="http://fly.layui.com/column/suggest/">建议</a></p>
										<span>7天前</span>
									</div>
								</dd>
								<dd>
									<div class="layui-status-img"><a href="javascript:;"><img style="width: 32px;height: 32px;border-radius: 50px;" src="${ APP_PATH}/static/admin/images/avatar.jpg"></a></div>
									<div>
										<p>就眠仪式 在 <a lay-href="https://gitee.com/Jmysy/Pear-Admin-Layui">Pear Admin 社区</a> 发布了 <a lay-href="http://fly.layui.com/column/suggest/">建议</a></p>
										<span>8天前</span>
									</div>
								</dd>
								<dd>
									<div class="layui-status-img"><a href="javascript:;"><img style="width: 32px;height: 32px;border-radius: 50px;" src="${ APP_PATH}/static/admin/images/avatar.jpg"></a></div>
									<div>
										<p>贤心 在 <a lay-href="https://gitee.com/Jmysy/Pear-Admin-Layui">Pear Admin 专区</a> 进行了 <a lay-href="http://fly.layui.com/vipclub/list/layuiadmin/column/quiz/">提问</a></p>
										<span>8天前</span>
									</div>
								</dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="layui-col-md3">
					<div class="layui-card">
						<div class="layui-card-header">最近更新</div>
						<div class="layui-card-body">
							<ul class="list">
								<li class="list-item"><span class="title">新增消息组件</span><span class="footer">2019-12-15 11:28</span></li>
								<li class="list-item"><span class="title">移动端兼容</span><span class="footer">2019-12-15 11:28</span></li>
								<li class="list-item"><span class="title">系统布局优化</span><span class="footer">2019-12-15 11:28</span></li>
								<li class="list-item"><span class="title">兼容多系统菜单模式</span><span class="footer">2019-12-15 11:28</span></li>
								<li class="list-item"><span class="title">兼容多标签页切换</span><span class="footer">2019-12-9 14:58</span></li>
								<li class="list-item"><span class="title">扩展下拉组件</span><span class="footer">2019-12-7 9:06</span></li>
								<li class="list-item"><span class="title">扩展卡片样式</span><span class="footer">2019-12-1 10:26</span></li>
								<li class="list-item" style="height: 37px;"><button style="border-radius: 8px!important;" class="layui-btn layui-btn-normal layui-btn-fluid">查
										看 更 多</button></li>
							</ul>
						</div>
					</div>
					<div class="layui-card">
						<div class="layui-card-header">版本信息</div>
						<div class="layui-card-body">
							<table class="layui-table">
								<thead>
									<tr>
										<th>项目名称</th>
										<th>Pear Admin</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>开源作者</td>
										<td>就 眠 仪 式</td>
									</tr>
									<tr>
										<td>当前版本</td>
										<td>2.0.1 Version</td>
									</tr>
									<tr>
										<td>基于框架</td>
										<td>Layui | JQuery | awesome</td>
									</tr>
									<tr>
										<td>开源协议</td>
										<td>Apache License</td>
									</tr>
									<tr>
										<td>开发周期</td>
										<td>2019 年 11 月 15 日</td>
									</tr>
									<tr>
										<td>产品定位</td>
										<td>Layui 前端模板框架</td>
									</tr>
									<tr>
										<td>所属社区</td>
										<td>Pear 社区</td>
									</tr>
									<tr>
										<td>开发文档</td>
										<td><a href="">查看文档</a></td>
									</tr>
									<tr>
										<td>下载渠道</td>
										<td>
											<button class="layui-btn layui-btn-normal layui-btn-sm">
												<i class="fa fa-gitlab"></i><span>&nbsp;码 云</span>
											</button>
											<button class="layui-btn layui-btn-primary layui-btn-sm">
												<i class="fa fa-github"></i><span>&nbsp;Git Hub</span>
											</button>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--</div>-->
		<script src="${ APP_PATH}/static/component/layui/layui.js" charset="utf-8"></script>
		<script>
			layui.use(['layer', 'echarts', 'element'], function() {
				var $ = layui.jquery,
					layer = layui.layer,
					element = layui.element,
					echarts = layui.echarts;

				var echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');

				var option = {
					tooltip: {
						trigger: 'axis'
					},
					xAxis: [{
						type: 'category',
						data: ['2019-01', '2019-02', '2019-03', '2019-04', '2019-05', '2019-06'],
						axisLine: {
							lineStyle: {
								color: "#999"
							}
						}
					}],
					yAxis: [{
						type: 'value',
						splitNumber: 4,
						splitLine: {
							lineStyle: {
								type: 'dashed',
								color: '#DDD'
							}
						},
						axisLine: {
							show: false,
							lineStyle: {
								color: "#333"
							},
						},
						nameTextStyle: {
							color: "#999"
						},
						splitArea: {
							show: false
						}
					}],
					series: [{
						name: '课时',
						type: 'line',
						data: [23, 60, 20, 36, 23, 85],
						lineStyle: {
							normal: {
								width: 8,
								color: {
									type: 'linear',

									colorStops: [{
										offset: 0,
										color: '#A9F387' // 0% 处的颜色
									}, {
										offset: 1,
										color: '#48D8BF' // 100% 处的颜色
									}],
									globalCoord: false // 缺省为 false
								},
								shadowColor: 'rgba(72,216,191, 0.3)',
								shadowBlur: 10,
								shadowOffsetY: 20
							}
						},
						itemStyle: {
							normal: {
								color: '#fff',
								borderWidth: 10,
								/*shadowColor: 'rgba(72,216,191, 0.3)',
								shadowBlur: 100,*/
								borderColor: "#A9F387"
							}
						},
						smooth: true
					}]
				};
				echartsRecords.setOption(option);

				window.onresize = function() {
					echartsRecords.resize();
				}

			});
		</script>
	</body>
</html>
