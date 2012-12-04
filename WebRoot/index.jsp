<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<base href="<%=basePath%>">
		<title>JqGrid4.4.1 Demo</title>
		<link rel="stylesheet" type="text/css" media="screen" href="<%=path %>/js/jquery/jquery-ui-1.9.2/css/ui-lightness/jquery-ui-1.9.2.custom.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=path %>/js/jquery/jqgrid-4.4.1/themes/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=path %>/js/jquery/jqgrid-4.4.1/themes/ui.multiselect.css" />
		<style>
			html,body {
				margin: 0; /* Remove body margin/padding */
				padding: 0;
				overflow: hidden; /* Remove scroll bars on browser window */
				font-size: 75%;
			}
			
			/*Splitter style */
			#LeftPane { /* optional, initial splitbar position */
				overflow: auto;
			}
			
			/*
			 * Right-side element of the splitter.
			 */
			#RightPane {
				padding: 2px;
				overflow: auto;
			}
			
			.ui-tabs-nav li {
				position: relative;
			}
			
			.ui-tabs-selected a span {
				padding-right: 10px;
			}
			
			.ui-tabs-close {
				display: none;
				position: absolute;
				top: 3px;
				right: 0px;
				z-index: 800;
				width: 16px;
				height: 14px;
				font-size: 10px;
				font-style: normal;
				cursor: pointer;
			}
			
			.ui-tabs-selected .ui-tabs-close {
				display: block;
			}
			
			.ui-layout-west .ui-jqgrid tr.jqgrow td {
				border-bottom: 0px none;
			}
			
			.ui-datepicker {
				z-index: 1200;
			}
			
			.rotate { /* for Safari */
				-webkit-transform: rotate(-90deg);
				/* for Firefox */
				-moz-transform: rotate(-90deg);
				/* for Internet Explorer */
				filter: progid :   DXImageTransform.Microsoft.BasicImage (   rotation =
					  3 );
			}
		</style>
		 
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/jquery.layout-latest.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jquery-ui-1.9.2/js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/i18n/grid.locale-cn.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/jquery.jqGrid.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/jquery.tablednd.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/jquery.contextmenu.js"></script>
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/ui.multiselect.js"></script>
		
		<script type="text/javascript" src="<%=path %>/js/jquery/jqgrid-4.4.1/js/src/grid.treegrid.js"></script>
		<script type="text/javascript">
		jQuery(document).ready(function(){
		    //$('#switcher').themeswitcher();
			$('body').layout({
				resizerClass: 'ui-state-default',
		        west__onresize: function (pane, $Pane) {
		            jQuery("#west-grid").jqGrid('setGridWidth',$Pane.innerWidth()-2);
				}
			});
			$.jgrid.defaults = $.extend($.jgrid.defaults,{loadui:"enable"});
			var maintab =jQuery('#tabs','#RightPane').tabs({
		        add: function(e, ui) {
		            // append close thingy
		            $(ui.tab).parents('li:first')
		                .append('<span class="ui-tabs-close ui-icon ui-icon-close" title="Close Tab"></span>')
		                .find('span.ui-tabs-close')
		                .click(function() {
		                    maintab.tabs('remove', $('li', maintab).index($(this).parents('li:first')[0]));
		                });
		            // select just added tab
		            maintab.tabs('select', '#' + ui.panel.id);
		        }
		    });
		    jQuery("#west-grid").jqGrid({
		    	treeGrid: true,
		        treeGridModel: "adjacency",
		        url: '<%=path%>/servlet/index',
		        mtype:"POST",
		        datatype: "json",
		        postData:{
		  	  		method:"getLeftTree"
		  	  	},
		        height: "auto",
		        pager: false,
		        loadui: "disable",
		        colNames: ["id","Items","url"],
		        colModel: [
		            {name: "id",width:1,hidden:true, key:true},
		            {name: "menu", width:150, resizable: false, sortable:false},
		            {name: "url",width:1,hidden:true}
		        ],
		        caption: "JQGrid4.4.1示例",
		        ExpandColumn: "menu",
		        autowidth: true,
		        //width: 180,
		        rowNum: 200,
		        ExpandColClick: true,
		        treeIcons: {leaf:'ui-icon-document-b'},
		        jsonReader:{
			        repeatitems:false,
			        root:"response"
		        },
		        onSelectRow: function(rowid) {
		            var treedata = $("#west-grid").jqGrid('getRowData',rowid);
		            if(treedata.isLeaf=="true") {
		                //treedata.url
		                var st = "#t"+treedata.id;
						if($(st).html() != null ) {
							maintab.tabs('select',st);
						} else {
							maintab.tabs('add',st, treedata.menu);
							//$(st,"#tabs").load(treedata.url);
							$.ajax({
								url: treedata.url,
								type: "GET",
								dataType: "html",
								complete : function (req, err) {
									$(st,"#tabs").append(req.responseText);
									var clck = '<p style="border: 1px solid; background-color: lemonchiffon; width:654px;height:25px;margin-bottom: 8px;padding-top: 8px;text-align: center">';
									clck += '<b>Please, support the jqGrid project by clicking on our sponsors ad! </b></p>';
									
									$(st,"#tabs").append(clck);
								}
							});
						}
		            }
		        }
		    });
			
		// end splitter
		
		});
		</script>
	</head>
	<body>
		<div id="LeftPane" class="ui-layout-west ui-widget ui-widget-content">
			<table id="west-grid"></table>
		</div>
		<!-- #LeftPane -->
		<div id="RightPane" class="ui-layout-center ui-helper-reset ui-widget-content">
			<!-- Tabs pane -->
			<div id="switcher"></div>
			<div id="tabs" class="jqgtabs">
				<ul>
					<li>
						<a href="#tabs-1">jqGrid 4.0</a>
					</li>
				</ul>
				<div id="tabs-1" style="font-size: 12px;">
					jqGrid 4.0 New search module, Tree Grid and SubGrid improvements,
					new colModel cellattr event and much more...
					<br />
					<br />
					Enjoy
					<br />
					<br />

					<p
						style="border: 1px solid; background-color: lemonchiffon; width: 728px; height: 25px; margin-bottom: 8px; padding-top: 8px; text-align: center">
						<b>Please, support the jqGrid project by clicking on our
							sponsors ad! </b>
					</p>

					<iframe src="" style="width: 728px; height: 100px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0" />
				</div>
			</div>
		</div>
		<!-- #RightPane -->
	</body>
</html>