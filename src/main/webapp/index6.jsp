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

<!-- 引入jquery -->
  <script src="${ APP_PATH}/static/js/jquery.min.js.js"></script>  
<!-- 引入bootstrap 样式 -->
<link
	href="${ APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="${ APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	 
</head>
<body>
	
	<!-- 用于给js中获取项目路径 -->
    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
	
		<!-- start 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">员工修改</h4>
	      </div>
	      <div class="modal-body">
	        
	        <!-- strat form -->
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">姓名：</label>
			    <div class="col-sm-6">
<!-- 			      <input type="text" class="form-control" id="empName_update_input" name="empName" placeholder="张三"> -->
     				  <p class="form-control-static" id="empName_update_static"></p> 
			          <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
 				 <label class="col-sm-2 control-label">邮箱：</label>
			    <div class="col-sm-6">
			      <input type="email" class="form-control" id="email_update_input" name="email" placeholder="xxx@qq.com">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>   
			  </div>
			  <div class="form-group">
 				 <label class="col-sm-2 control-label">性别：</label>
			    <div class="col-sm-6">
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
					</label>			    
				</div>
			  </div>
			  	 <div class="form-group">
 				 <label class="col-sm-2 control-label">部门：</label>
			    <div class="col-sm-6">
			    	<!-- 部门提交部门id -->
			       <select class="form-control" name="dId" id="dept_update_select">
  				   </select>
			    </div>
			  </div> 
 
			</form> 
	        <!-- end form -->
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- end 员工修改的模态框 -->

	<!-- start 员工添加的模态框 -->
	<div class="modal fade" id="empAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增</h4>
	      </div>
	      <div class="modal-body">
	        
	        <!-- strat form -->
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">姓名：</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="empName_add_input" name="empName" placeholder="张三">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
 				 <label class="col-sm-2 control-label">邮箱：</label>
			    <div class="col-sm-6">
			      <input type="email" class="form-control" id="email_add_input" name="email" placeholder="xxx@qq.com">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>   
			  </div>
			  <div class="form-group">
 				 <label class="col-sm-2 control-label">性别：</label>
			    <div class="col-sm-6">
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
					</label>			    
				</div>
			  </div>
			  	 <div class="form-group">
 				 <label class="col-sm-2 control-label">部门：</label>
			    <div class="col-sm-6">
			    	<!-- 部门提交部门id -->
			       <select class="form-control" name="dId" id="dept_add_select">
  				   </select>
			    </div>
			  </div> 
 
			</form> 
	        <!-- end form -->
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- end 员工添加的模态框 -->
	

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
				<button class="btn btn-primary" id="emp_add_modal_btn">
				 <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
					新增
				</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">
				 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					删除
				</button>
			</div>
		</div>
		<!--form表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table  table-hover" id="build_emps_table">
					<thead>
						<tr>
							<td><input type="checkbox" id="check_all"/></td>
							<td>序号</td>
							<td>姓名</td>
							<td>性别</td>
							<td>邮箱</td>
							<td>部门</td>
							<td>操作</td>
						</tr>
	 				</thead>
	 				<tbody>
<%-- 	 					<c:forEach items="${pageInfo.list}" var="emp"> --%>
<!-- 						 <tr> -->
<%-- 							<td>${emp.empId }</td> --%>
<%-- 							<td>${emp.empName }</td> --%>
<%-- 							<td>${emp.gender=="M"?"男":"女" }</td> --%>
<%-- 							<td>${emp.email }</td> --%>
<%-- 							<td>${emp.department.depName }</td> --%>
<!-- 							<td>				 -->
<!-- 								<button class="btn btn-primary  btn-sm"> -->
<!-- 								 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> -->
<!-- 									新增 -->
<!-- 								</button> -->
<!-- 								<button class="btn btn-danger  btn-sm"> -->
<!-- 								 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> -->
<!-- 									删除 -->
<!-- 								</button> -->
<!-- 							</td> -->
<!-- 						 </tr>  -->
<%-- 						</c:forEach> --%>
	 				</tbody>

				</table>
			</div>
		</div>
		
		<!-- 分页插件 -->
		<div class="row">
		  <!-- 分页文字信息 -->	
		  <div class="col-md-6" id="page_info_area">
<%-- 		  	 当前${ pageInfo.pageNum }页， 总 ${ pageInfo.pages }页， 总${ pageInfo.total }条记录 --%>
 
		  </div>
		   <!-- 分页条信息 -->
		  <div class="col-md-6" id="page_nav_area">
		  		
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
	 
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${ APP_PATH}/static/js/index.js"></script>	

</body>
</html>