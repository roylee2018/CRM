<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <!-- 引入easyUI css -->
    <link rel="stylesheet" href="themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="themes/icon.css" type="text/css"></link>
    <!-- 引入easyUi js -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
     .btnCls{
     	height: 28px;
     	width: 70px;
     	background-color: white;
     	border: 1px solid lightblue;
     	margin-left: 20px
     }
    </style>
    
    <script type="text/javascript">
    //获取cid
	function getClassCid(value,row,index){
		if(row.classInfo){
			return row.classInfo.cid;
		}
		return value;
	}
    //获取cname
    function getClassCname(value,row,index){
		if(row.classInfo){
			return row.classInfo.cname;
		}
		return value;
	}
    
    
    $(function(){
		//实现删除 根据编号实现删除    	
		$("#delBtn").click(function(){
			//提示框 alert,confirm,show,prompt,progress(进度条)
			//被选中的行
			var selRows = $("#dg").datagrid("getSelections");
			//判断有一行被选中
			if(selRows.length == 1){
				//准备参数
				var sidVal = selRows[0].sid;
				//使用ajax实现删除功能  将当前行sid传入action实现删除
				$.get("removeAction",{"sid":sidVal},function(res){
					//判断是否删除成功
					if(res == "suc"){
						$.messager.alert("信息","删除成功!","info");
						//删除成功后要刷新datagrid
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("错误","删除失败!","error");
					}
				});
				
			} else{
				$.messager.alert("提示","必须选中一行","warning");
				/*$.messager.show({
									title:"信息",
									msg:"信息",
									showType:"fade",
									timeout:1000
								  });
				*/
			}
		});
		
		
		//点击添加按钮显示 添加对话框addDialog
		//draggable:false 禁止拖动   modal:true 模态框不能编辑其他窗口
		$("#addBtn").click(function(){
			$("#addDialog").dialog({
				draggable : false,
				modal : true,
				onClose: function(){
					$("#addForm").form("clear");
				}
			});
			$("#addDialog").dialog("open");
		});
		
		
		//点击取消按钮 关闭窗口
		$("#addCancel").click(function(){
			//关闭窗口
			$("#addDialog").dialog("close");
		});
		
		//点击增加按钮实现 增加
		$("#addButton").click(function(){
			//获取表单所有的数据   key=value&key=value
			var params = $("#addForm").serialize();
			//使用ajax实现增加
			$.get("insertAction",params,function(res){
				if(res == "suc"){
					$.messager.alert("信息","新增成功!","info");
					//增加成功后要刷新datagrid
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("错误","新增失败!","error");
				}
				//关闭dialog
				$("#addDialog").dialog("close");
			});
		});
    });
    
    </script>
   
   </head>
  
  <body>
 	<table id="dg" class="easyui-datagrid" title="学生信息" 
 									data-options="url:'showAction',
 												fitColumns:true,
 												pagination:true,
 												pageSize:8,
 												pageNumber:1,
 												pageList:[8,12,15],
 												collapsible:true,
 												singleSelect:true,
 												toolbar:'#toolbar'">
 		<thead>
 			<tr>
 				<th data-options="field:'sid',width:100,align:'center'">学号</th>
				<th data-options="field:'sname',width:100,align:'center'">姓名</th>
				<th data-options="field:'cid',width:100,align:'center'"  formatter="getClassCid">班号</th>
				<th data-options="field:'cname',width:100,align:'center'" formatter="getClassCname">班名</th>
 			</tr>
 		</thead>
 	</table>
 	
 	<!-- 工具栏 -->
 	<div id="toolbar">
 		<a id="addBtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">增加</a>
 		<a id="delBtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
 		<a id="editBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>	
 	</div>
 	
 	
 	<!-- 增加窗口 -->
 	<div id="addDialog" class="easyui-dialog" title="增加学生" closed="true"
 			style="width: 400px; height: 400px">
 		<form id="addForm" method="post">
 			<table align="center" width="300px" height="300px">
 				<tr>
 					<td>学生姓名</td>
 					<td>
 						<input class="easyui-textbox" name="sname"/>
 					</td>
 				</tr>
 				<tr>
 					<td>班级</td>
 					<td>
 						<select name="classInfo.cid" class="easyui-combobox" style="width: 172px">
 							<option value="1">T65</option>
 							<option value="3">T66</option>
 						</select>
 					</td>
 				</tr>
 				<tr align="center">
 					<td><input type="button" class="btnCls" id="addButton" value="增加"/></td>
 					<td><input type="button" class="btnCls" id="addCancel" value="取消"/></td>
 				</tr>
 			</table>
 		</form>
 	</div>
  </body>
</html>
