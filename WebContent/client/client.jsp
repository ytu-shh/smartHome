<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
	
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>智能家居</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<link rel="stylesheet" href="<%=basePath%>layui/css/global.css">
<link rel="stylesheet" href="<%=basePath%>css/seekBar.css">
<script src="<%=contextPath%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=contextPath%>/layui/layui.all.js"></script>
<script src="<%=contextPath%>/js/echarts.min.js"></script>
<script src="<%=contextPath%>/js/seekBar.js"></script>

<style type="text/css">
	.queryFount {
		color: blue;
		font-weight: bold;
	}

</style>

</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">智能家居
				
			</div>
		</div>
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">服务端</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="<%=contextPath %>/server/server.jsp">设备控制</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">客户端</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#">设备模拟</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<!-- 内容主体区域-->
		<div class="layui-body">
		<form class="layui-form" action="">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 20px;">
				<legend>设备控制</legend>
			</fieldset>
			<div class="layui-form-item">	
				<label class="layui-form-label">选择家庭</label>
				<div class="layui-input-inline">
					<select name="home" id="home" lay-filter="home">
						<option value="home1">家庭1</option>
						<option value="home2">家庭2</option>
					</select>
				</div>
			</div>
			<div style="padding: 20px; background-color: #F2F2F2;">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">
								温度<span style="float: right;">当前温度：<span id="temperatureNowValue" class="queryFount"></span>℃</span>
								<input type="hidden" id="temperatureDeviceId">
							</div>
							<div class="layui-card-body">
								<div class="layui-form-item">
									<label class="layui-form-label">温度</label>
									<div class="layui-input-inline">
										<input type="text" id="temperatureSetValue" class="layui-input">
									</div>
									<button type="button" onclick="produceInstruct('temperature', '1')" class="layui-btn layui-btn-sm layui-btn-normal">设置温度</button>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">
								湿度<span style="float: right;">当前湿度：<span id="humidityNowValue" class="queryFount"></span>%</span>
								<input type="hidden" id="humidityDeviceId">
							</div>
							<div class="layui-card-body">
								<div class="layui-form-item">
									<label class="layui-form-label">湿度</label>
									<div class="layui-input-inline">
										<input type="text" id="humiditySetValue" class="layui-input">
									</div>
									<button type="button" onclick="produceInstruct('humidity', '1')" class="layui-btn layui-btn-sm layui-btn-normal">设置湿度</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 空调 -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header queryFount" id="airConditionerDeviceName"></div>
							<input type="hidden" id="airConditionerDeviceId">
							<div class="layui-card-body">当前状态： 
								开/关：<span id="airConditionerNowStatus" class="queryFount"></span>&nbsp;&nbsp;&nbsp;&nbsp;
								模式：<span id="airConditionerMode" class="queryFount"></span>&nbsp;&nbsp;&nbsp;&nbsp;
								风速：<span id=airConditionerWindSpeed class="queryFount"></span>&nbsp;&nbsp;&nbsp;&nbsp;
								温度：<span id=airConditionerTemperature class="queryFount"></span>℃
							</div>
						</div>
					</div>
					<!-- 门  -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header queryFount" id="doorDeviceName"></div>
							<input type="hidden" id="doorDeviceId">
							<div class="layui-card-body">当前状态: 
								<span id="doorNowValue" class="queryFount"></span>
							</div>
						</div>
					</div>
					<!-- 智能灯1 -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header queryFount" id="aiLamp1DeviceName"></div>
							<input type="hidden" id="aiLamp1DeviceId">
							<div class="layui-card-body">
								当前亮度 : <span id="aiLamp1NowValue" class="queryFount"></span>
							</div>
						</div>
					</div>
					<!-- 智能灯2 -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header queryFount" id="aiLamp2DeviceName"></div>
							<input type="hidden" id="aiLamp2DeviceId">
							<div class="layui-card-body">当前亮度 ： <span id="aiLamp2NowValue" class="queryFount"></span></div>
						</div>
					</div>
					<!-- 普通灯1 -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header queryFount" id="lamp1DeviceName"></div>
							<input type="hidden" id="lamp1DeviceId">
							<div class="layui-card-body">
								当前状态: <span id="lamp1NowValue" class="queryFount"></span>
							</div>
						</div>
					</div>
					<!-- 普通灯2 -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<input type="hidden" id="lamp2DeviceId">
							<div class="layui-card-header queryFount" id="lamp2DeviceName"></div>
							<div class="layui-card-body">当前状态 : <span id="lamp2NowValue" class="queryFount"></span></div>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>

		<c:if test="${!empty msg }">
			<script type="text/javascript">
				alert("${msg }");
			</script>
		</c:if>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© - 智能家居-smartHome
		</div>
	</div>
	<script>
		var contextPath = '<%=contextPath%>';
		//湿度图表对象
		
		$(function(){
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;
				//监听导航点击
				element.on('nav(test)', function(elem) {
					layer.msg(elem.text());
				});
			});
			
			//监听切换家庭事件
			layui.form.on('select(home)', function(data){
				queryDeviceValue();
			});  
			layui.use('form', function() {
				var form = layui.form;
				form.render();
			});
			queryDeviceValue();
		});

		//查询所有设备值
		function queryDeviceValue() {
			$.ajax({
				//请求方式
				type : 'POST',
				//请求的媒体类型
				contentType : 'application/json;charset=UTF-8',
				async : false,
				//请求地址
				url : contextPath + '/client/queryDeviceValue.do',
				//数据，json字符串
				data : JSON.stringify({
					'homeId' : $('#home').val()
				}),
				//请求成功
				success : function(result) {
					if (result) {
						var lampCount = 1;
						var aiLampCount = 1;
						for (var i = 0; i < result.length; i++) {
							//温度传感器
							if (result[i].deviceType === 'temperature') {
								$('#temperatureNowValue').html(
										result[i].deviceValue);
								$('#temperatureDeviceId').val(
										result[i].deviceId);
								$('#temperatureDeviceName').html(
										result[i].deviceName);
							}
							//湿度传感器
							else if (result[i].deviceType === 'humidity') {
								$('#humidityNowValue').html(
										result[i].deviceValue);
								$('#humidityDeviceId').val(
										result[i].deviceId);
								$('#humidityDeviceName').html(
										result[i].deviceName);
							}

							//灯
							else if (result[i].deviceType === 'lamp') {
								$('#lamp' + lampCount + 'DeviceId')
										.val(result[i].deviceId);
								$('#lamp' + lampCount + 'DeviceName')
										.html(result[i].deviceName);

								if (result[i].deviceValue == '1') {
									$('#lamp' + lampCount + 'NowValue').html('开');
								} else {
									$('#lamp' + lampCount + 'NowValue').html('关');
								}
								lampCount++;
							}

							//智能灯
							else if (result[i].deviceType === 'aiLamp') {
								$('#aiLamp' + aiLampCount + 'DeviceId').val(result[i].deviceId);
								$('#aiLamp' + aiLampCount + 'DeviceName').html(result[i].deviceName);
								$('#aiLamp' + aiLampCount + 'NowValue').html(result[i].deviceValue ? result[i].deviceValue : 0);
								aiLampCount++;
							}

							//门
							else if (result[i].deviceType === 'door') {
								$('#doorDeviceId').val(result[i].deviceId);
								$('#doorDeviceName').html(result[i].deviceName);
								if (result[i].deviceValue == '1') {
									$('#doorNowValue').html('开');
								} else {
									$('#doorNowValue').html('关');
								}
							}

							//空调
							else if (result[i].deviceType === 'airConditioner') {
								$('#airConditionerDeviceId').val(result[i].deviceId);
								$('#airConditionerDeviceName').html(result[i].deviceName);
								if (result[i].deviceValue == '1') {
									//当前状态
									$('#airConditionerNowStatus').html('开');
									
								} else {
									$('#airConditionerNowStatus').html('关');
								}
								//模式
								$('#airConditionerMode').html(getAirConditionerMode(result[i].airConditionerMode));
								//风速
								$('#airConditionerWindSpeed').html(getAirConditionerWindSpeed(result[i].airConditionerWindSpeed));
								$('#airConditionerTemperature').html(result[i].airConditionerTemperature);
								
								
							}
						}
					}
					layui.form.render(); 

				},
				//请求失败，包含具体的错误信息
				error : function(e) {
					console.log(e.status);
					console.log(e.responseText);
				}
			});
			
				
		}
		
		function setAirConditioner() {
			var action = $('#airConditionerSetStatus').prop('checked') ? 1 : 0;
			produceInstruct('airConditioner', action);
		}

		//获取空调模式
		function getAirConditionerMode(code) {
			if (!code) {
				return '';
			} else if (code == '1') {
				return '制冷';

			} else if (code == '2') {
				return '制冷';

			} else if (code == '3') {
				return '制冷';
			} else {
				return '';
			}
		}

		//获取空调风速
		function getAirConditionerWindSpeed(code) {
			if (!code) {
				return '';
			} else if (code == '1') {
				return '低风';

			} else if (code == '2') {
				return '中风';

			} else if (code == '3') {
				return '强风';
			} else {
				return '';
			}
		}
		
		//生成指令   并调用控制设备方法
		function produceInstruct(deviceType, action) {
			var instruct = {};
			var deviceId = '';
			if(deviceType === 'humidity'){
				deviceId = $('#humidityDeviceId').val();
				instruct = {
					'humidityValue' : $('#humiditySetValue').val()
				 };
			}
			
			else if(deviceType === 'temperature'){
				deviceId = $('#temperatureDeviceId').val();
				instruct = {
					'temperatureValue' : $('#temperatureSetValue').val()
				 };
			}
			
			controlDevice(deviceId, deviceType, instruct);
		}

		//控制设备  参数： 设备id  设备类型   指令
		function controlDevice(deviceId, deviceType, instruct) {
			$.ajax({
				//请求方式
				type : 'POST',
				//请求的媒体类型
				contentType : 'application/json;charset=UTF-8',
				//请求地址
				url : contextPath + '/client/controlDevice.do',
				dataType: 'text',
				//数据，json字符串
				data : JSON.stringify({
					'deviceId' : deviceId,
					'homeId' : $('#home').val(),
					'deviceType' : deviceType,
					'instruct' : instruct
				}),
				//请求成功
				success : function(result) {
					layer.msg('执行成功，等待页面刷新！');
					setTimeout(function(){queryDeviceValue();}, 3000);
				},
				//请求失败，包含具体的错误信息
				error : function(e) {
					console.log(e.status);
					console.log(e.responseText);
				}
			});
		}
	</script>
</body>
</html>
