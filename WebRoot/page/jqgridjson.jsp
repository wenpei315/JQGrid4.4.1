<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>JqGrid4.4.1示例</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery/jquery-ui-1.9.2/css/ui-lightness/jquery-ui-1.9.2.custom.css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery/jqgrid-4.4.1/themes/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery/jqgrid-4.4.1/themes/ui.multiselect.css" />
		
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jquery-ui-1.9.2/js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/i18n/grid.locale-cn.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/jquery.jqGrid.min.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function() {
				jQuery("#list").jqGrid({
			  	  	url:'<%=path%>/servlet/JqGridJsonDemo',
			  	  	mtype:"POST",
			  	  	datatype: "json",
			  	  	postData:{
			  	  		method:"query"
			  	  	},
			  	  	colNames:['Inv No','Date', 'Client','Amount','Tax','Total','Notes'], 
			  	  	colModel:[ 
			  	  	  	  	{name:'invid',index:'invid', width:55,align:'center'}, 
			  	  	  	  	{name:'invdate',index:'invdate', width:120},
			  	  	  	  	{name:'name',index:'name', width:90},
			  	  	  	  	{name:'amount',index:'amount', width:80, align:"right"}, 
			  	  	  	  	{name:'tax',index:'tax', width:80, align:"right"}, 
			  	  	  	  	{name:'total',index:'total', width:80,align:"right"}, 
			  	  	  	  	{name:'note',index:'note', width:150, sortable:false} 
			  	  	],
			  	  	rowNum:10,
			  	  	rowList:[10,20,30],
			  	  	pager: '#pager', 
			  	  	sortname: 'invid', 
			  	  	viewrecords: true, 
			  	  	sortorder: "desc", 
			  	  	caption:"JSON Example",
			  	  	width:450,
			  	  	jsonReader : {
				        root:"rows",
				        page: "page",
				        total: "total",
				        records: "records",
				        repeatitems: false
				    }
			  	});
			  	jQuery("#list").jqGrid('navGrid','#pager',{edit:false,add:false,del:false});
			});
		</script>
	</head>
	<body>
		<table id="list"></table>
		<div id="pager"></div>
	</body>
</html>