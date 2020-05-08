<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>校园即时服务平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<c:if test="${!empty loginflag }">
	<script type="text/javascript">
		window.location = "<%=basePath%>";
	</script>
</c:if>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<link rel="stylesheet" href="<%=basePath%>layui/css/global.css">
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">智能家居</div>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">

					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">服务端</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="server/server.jsp">设备控制</a>
							</dd>
						</dl>
					</li>
					
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">客户端</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="client/client.jsp">设备模拟</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<!-- 内容主体区域-->
		<div class="layui-body " style="background-image: url(images/smartHome.jpg)">
		</div>

		<c:if test="${!empty msg }">
			<script type="text/javascript">
				alert("${msg }");
			</script>
		</c:if>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			©  - 智能家居-smartHome
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
			//监听导航点击
			element.on('nav(test)', function(elem) {
				layer.msg(elem.text());
			});
		});
	</script>
	<script type="text/javascript">
		var form;
		layui.use([ 'layedit', 'form' ], function() {
			form = layui.form;
	
			//自定义验证规则
			form.verify({
				schoolidstr : function(value) {
					if (value.length < 1) {
						return '学校选择出现问题';
					}
				}
			});
	
	
		});
		//加载layui中的jq
		layui.use([ 'jquery', 'layer' ], function() {
			var $ = layui.$, //重点处
				layer = layui.layer;
	
			$(function() {
			});
		});
	</script>
	<script>
		function getPuser(stuid) {
			//iframe层
			layer.open({
				type : 2,
				title : '该用户信息',
				shadeClose : true,
				shade : false,
				area : [ '1000px', '600px' ],
				content : 'common/getuser.do?stuidstr=' + stuid
			});
		}
		function getTask(tidstr) {
			//iframe层
			layer.open({
				type : 2,
				title : '该任务信息',
				shadeClose : true,
				shade : false,
				area : [ '1000px', '600px' ],
				content : 'task/gettaskinfo.do?tidstr=' + tidstr
			});
		}
	</script>
	<script type="text/javascript">
		layui.use('laypage', function() {
			var laypage = layui.laypage;
	
			//执行一个laypage实例
			laypage.render({
				elem : 'test1', //注意，这里的 test1 是 ID，不用加 # 号
				count : '${p.total}',//数据总数，从服务端得到
				limit : '${p.pageSize}',
				curr: '${p.pageNum }',
				jump: function(obj,first){//点击页码出发的事件
                	if(first!=true){//是否首次进入页面  
                    	var currentPage = obj.curr;//获取点击的页码      
                    	window.location.href ="<%=path%>/task/list.do?words=${words }&schoolidstr=${schoolidstr }&page="+currentPage;  
                	}  
                }  
			});
		});
	</script>
</body>
</html>
