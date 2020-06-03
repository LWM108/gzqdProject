
		//定义一个变量，来保存总记录数
		var totalRecord;//总记录数
		var currentNum;//当前页
	
	    //1、页面加载完后，发送ajax请求获取数据，给当前页面使用	
		$(function(){
			//去首页
			to_page(1);
		});
		
		//跳转到指定页面
		function to_page(pn){
			
			$.ajax({
				url:$("#PageContext").val()+"/employee/list",
				data:{ pn: pn },
				type:"GET",
				success:function(result){
					
// 					console.log(result); 
					//解析显示 员工table内容
					build_emps_table(result);
					//分页文字信息
					build_page_info(result); 
					//分页条信息(1 2 3 4 5)
					build_page_nav(result);
				}
			});
		}
	
		//根据接收到的ajax返回内容，显示表格内容
		function build_emps_table(result){
			
			//每次调用前清空数
			$("#build_emps_table tbody").empty();
			
			var emps = result.data.pageInfo.list;
			$.each(emps,function(index,item){
// 				alert(item.empName);
				var checkBoxTd = $("<td><input type='checkbox' class='check_item' /></td>");
				var empId =$("<td></td>").append(item.empId); 
				var empName =$("<td></td>").append(item.empName); 
				var gender =$("<td></td>").append(item.gender=="M"?"男":"女"); 
				var email =$("<td></td>").append(item.email); 
				var depName =$("<td></td>").append(item.department.depName); 
				var editButton = $("<td></td>").append( $("<buttopn></button>"))
											   .addClass("btn btn-primary  btn-sm edit_btn")
											   .append( $("<span></span>")).addClass("glyphicon glyphicon-pencil")
											   .append("编辑");
					//为编辑按钮添加一个自定义属性，来表示当前员工的id
					editButton.attr("edit-id",item.empId);
				
				var deleteButton = $("<td></td>").append( $("<buttopn></button>"))
				   .addClass("btn btn-danger  btn-sm delete_btn")
				   .append( $("<span></span>")).addClass("glyphicon glyphicon-trash")
				   .append("删除");
					//为编辑按钮添加一个自定义属性，来表示当前员工的id
					deleteButton.attr("dele-id",item.empId);
				
				var button = $("<td></td>").append(editButton).append(" ").append(deleteButton);
				
				$("<tr></tr>").append(checkBoxTd)
				.append(empId)
				.append(empName)
				.append(gender)
				.append(email)
				.append(depName)
				.append(button)
				.appendTo("#build_emps_table tbody");
  

			});
		}
		
		//分页文字信息
		function build_page_info(result){
			
			//每次调用前清空数
			$("#page_info_area").empty();
			
			var pageInfo = result.data.pageInfo;
			$("#page_info_area").append(" 当前"+  pageInfo.pageNum +"页， 总"+ pageInfo.pages +"页， 总"+ pageInfo.total +"条记录");
			
			//赋值全局变量  总记录数
			totalRecord = pageInfo.total;
			//赋值全局变量 当前页
			currentNum = pageInfo.pageNum;
		}
		
		//分页条信息(1 2 3 4 5)
		function build_page_nav(result){
			
			//每次调用前清空数
			$("#page_nav_area").empty();
			
			var ul = $("<ul></ul>").addClass("pagination");
			
			//分页插件里  首页的LI
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#")); 
			//var firstPageLi = $("<li></li>").append("<a href='#' aria-label='Previous'>首页</a>");
			//前一页
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#")); 
			//是否有前一页
			if(result.data.pageInfo.hasPreviousPage == false){
				prePageLi.addClass("disabled");//是否有前一页
				firstPageLi.addClass("disabled");//是否有 首页
			}else{
				//首页 配置点击事件
				firstPageLi.click(function(){
					to_page(1);
				});
				//前一页  配置点击事件
				prePageLi.click(function(){
					to_page(result.data.pageInfo.pageNum - 1);
				});
			} 
			 
			//添加首页跟前一页的内容到ul 元素中
			ul.append(firstPageLi).append(prePageLi);
			
			//下一页
			var prePageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#")); 
			//分页插件里  末页的LI
			//var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#")); 
			var lastPageLi = $("<li></li>").append("<a href='#' aria-label='Previous'>末页</a>");
			//是否有前一页
			if(result.data.pageInfo.hasNextPage == false){
				prePageLi.addClass("disabled");//是否有前一页
				lastPageLi.addClass("disabled");//是否有 首页
			}else{
				//下一页  配置点击事件
				prePageLi.click(function(){
					to_page(result.data.pageInfo.pageNum + 1);
				});
				//末页 配置点击事件
				lastPageLi.click(function(){
					to_page(result.data.pageInfo.pages);
				});
			} 
			
			  
			//表里接收到的页码 1 2 3 4 5 ,遍历添加到 ul中
			$.each(result.data.pageInfo.navigatepageNums ,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#")); 
				if(result.data.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				}); 
			    ul.append(numLi);
			});
			
			//添加末页跟下一页的内容到ul 元素中
			ul.append(prePageLi).append(lastPageLi);
			
			var navEle = $("<nav aria-label='Page navigation'></nav>").append(ul);
			//把内容添加到导航条的标签上
			navEle.appendTo("#page_nav_area");
		}
		
		//清空表单的样式及内容
		function reset_form(ele){ 
			//清除表单内容
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//点击新增，打开模态框
		$("#emp_add_modal_btn").click(function(){
		 
			//弹出前，清空表单数据
			 reset_form("#empAndModal form")
// 			$("#empAndModal form")[0].reset();
			
		 	//发送ajax请求，显示部门信息在下拉列表上
			getDepts("#empAndModal select");
 			//弹出模态框
			$("#empAndModal").modal({
				backdrop:"static"
			}); 
		 	
		});
		
		//查出所有部门信息并显示在下拉列表上
		function getDepts(ele){
			//每次加载前，清空数据
			$(ele).empty();
			
			$.ajax({
				url:$("#PageContext").val()+"/department/list",
// 				data:{ pn: pn },
				type:"GET",
				success:function(result){
					
// 					console.log(result); 
					//显示部门信息在下拉列表中 
					$.each(result.data.departmentsList ,function(index,item){
						
						var optionDepent = $("<option></option>").append(item.depName).attr("value",item.depId)
						optionDepent.appendTo(ele);
					});
 
				}
			});
		}
		
		//校验表单数据
		function validata_add_form(){
			//1、拿到要校验的数据，使用正则表达式
			//获取姓名
			var empName = $("#empName_add_input").val();   
            //校验姓名
			var regName = /(^[a-z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
 
            if( !regName.test(empName) ){
// 				alert("用户名可以为中文2-5位，或者3-16英文和数字组合。");  
// 				$("#empName_add_input").parent().addClass("has-error");
// 				$("#empName_add_input").next("span").text("用户名可以为中文2-5位，或者3-16英文和数字组合。");
				show_validate_msg("#empName_add_input","error","用户名可以为中文2-5位，或者3-16英文和数字组合。")

            	return false;
            }else{
// 				$("#empName_add_input").parent().addClass("has-success");
// 				$("#empName_add_input").next("span").text("");
				show_validate_msg("#empName_add_input","success","")

            }
 
			//获取邮箱的值
			var email = $("#email_add_input").val();
            //检验邮箱
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if( !regEmail.test(email) ){
// 				alert("邮箱格式不正确。"); 
// 				$("#email_add_input").parent().addClass("has-error");
// 				$("#email_add_input").next("span").text("邮箱格式不正确。");
				show_validate_msg("#email_add_input","error","邮箱格式不正确。")
            	return false;
            }else{
// 				$("#email_add_input").parent().addClass("has-success");
// 				$("#email_add_input").next("span").text("");
				show_validate_msg("#email_add_input","success","")
            }
  
			return true; 
		}
		
		//显示校验结果的信息     元素，状态，提示信息
		function show_validate_msg(ele,status,msg){
			//清楚当前元素 校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			
			if( "success" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		} 
		
		//校验用户名是否可用(重复)
		$("#empName_add_input").change(function(){
			//校验前先清空
//			$("#empName_add_input").removeAttr("ajax-va");
			
			//发送ajax请求获取数据
			var empName = this.value; //$("#empName_add_input").val()
			$.ajax({
				url:$("#PageContext").val()+"/employee/checkEmpName",
				data:{"empName":empName}, 
				type:"POST",
				success:function(result){
					
 					if(result.code == 100){
 						show_validate_msg("#empName_add_input","success","用户名可用。");
 						//根据 校验重复名称来添加不同的元素
 					    $("#empName_add_input").attr("ajax-va","success");
 					}else{
 						show_validate_msg("#empName_add_input","error", result.data.va_msg);
 						//根据 校验重复名称来添加不同的元素
 					    $("#empName_add_input").attr("ajax-va","error"); 
 					}
				 }
			}); 
			
		});

		
		//点击保存，保存员工信息
		$("#emp_save_btn").click(function(){
			//1、模态框中填写的表单数据，提交给服务器进行保存
			//保存前先对数据进行校验
			if(!validata_add_form()){ 
				return false;
			}
 			
			//根据 校验重复名称 不同的元素 来判断是否提交(判断之前的ajax用户名校验是否成功，如果失败)
			if( $("#empName_add_input").attr("ajax-va") == "error" ){ 
				return false;
			}
			//2、发送ajax请求保存员工信息 
			$.ajax({
				url:$("#PageContext").val()+"/employee/saveEmployee",
				data:$("#empAndModal form").serialize(), 
				type:"POST",
				success:function(result){
 					
					if(result.code == 100 ){
	 					//员工保存成功：
	 					//1、关闭模态框
	 					$("#empAndModal").modal("hide");
	 					//2、来到最后一页，显示刚刚保存的数据
	 					to_page(totalRecord); 
					}else{
						
						if(undefined != result.data.errorFi.email){
							//显示邮箱错误信息
							show_validate_msg("#email_add_input","error",result.data.errorFi.email)
						}
						if(undefined != result.data.errorFi.empName){
							//显示姓名错误信息
							show_validate_msg("#empName_add_input","error",result.data.errorFi.empName)
						}
					} 
				 }
			}); 
			
		});
		
		
		//1、绑定编辑每个按钮
		$(document).on("click",".edit_btn",function(){
			   
			//1、发送ajax请求查出部门信息，并显示在部门列表上
			getDepts($("#empUpdateModal select"));
			//2、查出员工信息
			getEmp($(this).attr("edit-id") );
			//3、把员工id 传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id") );
			
			//弹出模态框前，清空表单数据
			reset_form("#empUpdateModal form")
			
			//弹出模态框
			$("#empUpdateModal").modal({
				backdrop:"static"
			}); 
		});
		
		
		//查询员工信息
		function getEmp(id){
			
			$.ajax({
				url:$("#PageContext").val()+"/employee/getEmployee/"+id,
				type:"GET",
				success:function(result){
 					//打印信息
					console.log(result);
					var empData = result.data.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val([empData.gender]);
					//部门信息
//					$("#empUpdateModal select").val([empData.dId]);
					$("#empUpdateModal select").find("option[value="+empData.dId+"]").attr("selected",true);
  
				 }
			});
		}
		
		//点击更新按钮，更新员工信息
		$("#emp_update_btn").click(function(){
			
			//验证邮箱是否合法
			//获取邮箱的值
			var email = $("#email_update_input").val();
            //1、检验邮箱
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if( !regEmail.test(email) ){ 
				show_validate_msg("#email_update_input","error","邮箱格式不正确。")
            	return false;
            }else{ 
				show_validate_msg("#email_update_input","success","")
            }
            
            //2、发送ajax请求，保存更新员工数据
    		$.ajax({
				url:$("#PageContext").val()+"/employee/updateEmployee/"+$(this).attr("edit-id"),
				data:$("#empUpdateModal form").serialize(), 
				type:"PUT",
				success:function(result){
 					
//						alert(result.msg); 
 					//1、关闭模态框
 					$("#empUpdateModal").modal("hide"); 
					//2、回到对应页面
 					to_page(currentNum); 
				 }
			});
			
		});
			
	
		
		//单个删除
		$(document).on("click",".delete_btn",function(){

			//员工姓名
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			//员工id
			var empId = $(this).attr("dele-id");
			
			//弹出是否确认删除 
			if(confirm("确认删除【"+empName+"】吗？")){
				//确认，发送ajax请求，进行删除
	    		$.ajax({
					url:$("#PageContext").val()+"/employee/deleteEmpById/"+empId, 
					type:"DELETE",
					success:function(result){
	 					
//						alert(result.msg);   
//						//2、回到对应页面
	 					to_page(currentNum); 
					 }
				});
				
			}   
	 
		});
		
		//全选/全不选
		$("#check_all").click(function(){
			
			//attr获取的是自定义的属性， 原生的用prop进行过去 
			 $(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//当前页面所有单选，选满，就把check_all 选择上
		$(document).on("click",".check_item",function(){
			//判断当前选中的元素的个数
			var flag = $(".check_item:checked").length == $(".check_item").length;
			//给全选/全不选赋值
			$("#check_all").prop("checked",flag);
  
		});
		
		
		//点击全部删除，就进行批量删除
		$("#emp_delete_all_btn").click(function(){
			
			//姓名
			var empNames = "";
			//员工id
			var empId = "";
			
			$.each($(".check_item:checked"),function(){
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				empId += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			
			//去除多余的员工姓名 ,号
			empNames = empNames.substring(0,empNames.length-1);
			//去除多余的员工id - 号
			empId = empId.substring(0,empId.length-1);
			
			if(confirm("确认删除【"+empNames+"】吗")){
				//发送ajax请求，进行批量删除
	    		$.ajax({
					url:$("#PageContext").val()+"/employee/deleteEmpById/"+empId, 
					type:"DELETE",
					success:function(result){
	 					
						alert(result.msg);  
//						//2、回到对应页面
	 					to_page(currentNum); 
					 }
				});
			}
			
		});
		
	