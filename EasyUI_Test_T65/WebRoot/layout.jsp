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
   </head>
  
  <body>
 	<div id="cc" class="easyui-layout" data-options="fit:true" style="width:600px;height:400px;">   
	    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>   
	    <div data-options="region:'west',title:'West',split:true" style="width:100px;">
	    	<ul id="tt" class="easyui-tree">   
    <li>   
        <span>Folder</span>   
        <ul>   
            <li>   
                <span>Sub Folder 1</span>   
                <ul>   
                    <li>   
                        <span><a href="#">File 11</a></span>   
                    </li>   
                    <li>   
                        <span>File 12</span>   
                    </li>   
                    <li>   
                        <span>File 13</span>   
                    </li>   
                </ul>   
            </li>   
            <li>   
                <span>File 2</span>   
            </li>   
            <li>   
                <span>File 3</span>   
            </li>   
        </ul>   
    </li>   
    <li>   
        <span>File21</span>   
    </li>   
</ul>  
	    	
	    </div>   
	    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>   
	</div> 
  </body>
</html>
