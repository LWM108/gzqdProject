<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- 引入bootstrap 样式 -->
<link
	href="${ APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="${ APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- 引入jquery -->
  <script src="${ APP_PATH}/static/js/jquery.min.js.js"></script>  

</head>
<body>

	<!-- 显示页面 -->
	<div class="container">
		<!-- 左上角标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>gzqd-curd</h1>
			</div>
		</div>
		<!-- 按钮   新增 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">
				 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					新增
				</button>
				<button class="btn btn-danger">
				 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					删除
				</button>
			</div>
		</div>
		<!--form表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table  table-hover">
					<tr>
						<td>序号</td>
						<td>姓名</td>
						<td>性别</td>
						<td>邮箱</td>
						<td>部门</td>
						<td>操作</td>
					</tr>
	 
					<c:forEach items="${pageInfo.list}" var="emp">
						 <tr>
							<td>${emp.empId }</td>
							<td>${emp.empName }</td>
							<td>${emp.gender=="M"?"男":"女" }</td>
							<td>${emp.email }</td>
							<td>${emp.department.depName }</td>
							<td>				
								<button class="btn btn-primary  btn-sm">
								 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									新增
								</button>
								<button class="btn btn-danger  btn-sm">
								 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr> 
					</c:forEach>
				</table>
			</div>
		</div>
		
		<!-- 分页插件 -->
		<div class="row">
		  <!-- 分页文字信息 -->	
		  <div class="col-md-6">
		  	 当前${ pageInfo.pageNum }页， 总 ${ pageInfo.pages }页， 总${ pageInfo.total }条记录
 
		  </div>
		   <!-- 分页条信息 -->
		  <div class="col-md-6">
		  		
		  	<nav aria-label="Page navigation">
			  <ul class="pagination">
			    <li><a href="${ APP_PATH}/employee/list?pn=1">首页</a></li>
			    
			  	<c:if test="${pageInfo.hasPreviousPage }"> 
				    <li>
				      <a href="${ APP_PATH}/employee/list?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    
			    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
			    	
			    	<c:if test="${pageInfo.pageNum == page_Num}">
			    		<li class="active "><a href="${ APP_PATH}/employee/list?pn=${page_Num }" >${page_Num }</a></li>
			    	</c:if>
			    	
			    	<c:if test="${pageInfo.pageNum != page_Num}">
			    		<li><a href="${ APP_PATH}/employee/list?pn=${page_Num }" >${page_Num }</a></li>
			    	</c:if>
			    	
			    </c:forEach>
 				
 				<c:if test="${pageInfo.hasNextPage }"> 
			    <li>
			      <a href="${ APP_PATH}/employee/list?pn=${pageInfo.pageNum+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
			    
			    <li><a href="${ APP_PATH}/employee/list?pn=${pageInfo.pages }">末页</a></li>
			  </ul>
			</nav>
		  		
		  </div>  
		</div>
		

	</div>
	
</body>
</html>