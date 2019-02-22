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
    <script type="text/javascript">
	$(function(){
		//点击删除按钮
		$("#delBtn").click(function(){
			//获取id为dg的datagrid被选中的数据(判断是否选中数据)
			//getSelections方法用于获取被选中的行数 返回数组
			var selArr = $("#dg").datagrid("getSelections");
			//判断是否选中数据
			if(selArr.length > 0){
				//....请求action
			} else {
				//alert 其实是一个div
				$.messager.alert("提示","至少要选中一行数据执行删除!","error");				
			}
		});
		
		
		//点击addBtn显示addDialog
		$("#addBtn").click(function(){
			//显示id为addDialog的对话框
			$("#addDialog").dialog("open");
		});
		
		//点击修改按钮 将修改的数据现在在editDialog中
		$("#modBtn").click(function(){
			var selArr = $("#dg").datagrid("getSelections");
			//判断是否选中
			if(selArr.length > 0){
				//显示editDialog
				$("#editDialog").dialog("open");
				//将被选中的行数据 显示在表单中
				$("#editForm").form("load",{
					uid     :  selArr[0].uid,
					username:  selArr[0].username,
					age     :  selArr[0].age
				});
			} else {
				$.messager.alert("信息","必须选中一行","error");
			}
		});
	});  
    </script>
   </head>
  
  <body>
 	<!-- 编写datagrid  -->
 	<table id="dg" class="easyui-datagrid" title="用户信息" 
 									data-options="url:'1.json',
 												 singleSelect:true,
 												 fitColumns:true,
 												 collapsible:true,
 												 pagination:true,
 												 pageList:[2,3,5],
 												 pageSize:2,
 												 pageNumber:1,
 												 toolbar:'#tb'">
 		<thead>
 			<tr>
	 			<th data-options="field:'uid',width:100,align:'center'">编号</th>
	 			<th data-options="field:'username',width:100,align:'center'">用户名</th>
	 			<th data-options="field:'age',width:100,align:'center'">年龄</th>
 			</tr>
 		</thead>
 	</table>
 	
 	<!-- 声明工具栏 -->
 	<div id="tb">
 		<a href="#" id="addBtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">增加</a>
 		<a href="#" id="delBtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
 		<a href="#" id="modBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
 	</div>
 	
 	<!-- 增加数据面板 Dialog-->
 	<div id="addDialog" class="easyui-dialog" title="增加用户" closed="true"
 		style="width: 300px;height: 300px">
		 	
 	</div>
 	
 	<!-- 修改数据面板 Dialog -->
 	<div id="editDialog" class="easyui-dialog" title="修改用户" closed="true"
 		style="width: 300px;height: 300px">
 		
 		<form id="editForm" method="post">
			 编号:<input type="text" name="uid"/><br>
			 用户名:<input type="text" name="username"/><br>
			年龄:<input type="text" name="age"/><br>
			<input type="submit" value="修改"/>
		</form>
		
 	</div>
  </body>
</html>
