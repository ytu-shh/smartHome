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
								<a href="#">设备控制</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">客户端</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="<%=contextPath %>/client/client.jsp">设备模拟</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<!-- 内容主体区域-->
		<div class="layui-body">
		<form id="serverForm" class="layui-form" action="">
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
			<div style="float: right;margin-top: -50px;margin-right: 25px;">
				<label class="layui-form-label">自动刷新</label>
				<div class="layui-input-block">
					<input id="autoRefresh" type="checkbox" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
				</div>
			</div>
			<div style="padding: 20px; background-color: #F2F2F2;">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">
								温度<span style="float: right;">当前温度：<span id="temperatureNowValue" class="queryFount"></span>℃</span>
								<input type="hidden" id="temperatureDeviceId">
							</div>
							<div class="layui-card-body">
								<div id="temperatureChart" style="height: 40%"></div>
							</div>
						</div>
					</div>
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">
								湿度<span style="float: right;">当前湿度：<span id="humidityNowValue" class="queryFount"></span>%</span>
								<input type="hidden" id="humidityDeviceId">
							</div>
							<div class="layui-card-body">
								<div id="humidityChart" style="height: 40%"></div>
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
							<div class="layui-card-body">
								控制状态：
								<div class="layui-form-item">
									<div class="layui-inline">
										<label class="layui-form-label">开关</label>
										<div class="layui-input-block">
											<input type="checkbox" id="airConditionerSetStatus" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
										</div>
									</div>
									<div class="layui-inline">
										<label class="layui-form-label">温度</label>
										<div class="layui-input-block">
											<input type="text" id="airConditionerSetTemperature" class="layui-input">
										</div>
									</div>
								</div>
								<div class="layui-form-item">	
									<label class="layui-form-label">模式</label>
									<div class="layui-input-inline">
										<select name="airConditionerSetMode" id="airConditionerSetMode">
											<option value="1">制冷</option>
											<option value="2">制热</option>
											<option value="3">送风</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">	
									<label class="layui-form-label">风速</label>
									<div class="layui-input-inline">
										<select name="airConditionerSetWindSpeed" id="airConditionerSetWindSpeed">
											<option value="1">低风</option>
											<option value="2">中风</option>
											<option value="3">强风</option>
										</select>
									</div>
								</div>
								<button type="button" onclick="setAirConditioner()" class="layui-btn layui-btn-sm layui-btn-normal">设置</button>
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
							<div class="layui-card-body">控制状态 : 
								<div class="layui-form-item">
									<label class="layui-form-label">开/关:</label>
									<div class="layui-input-block">
										<input type="checkbox" id="doorSetStatus" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
									</div>
								</div>
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
							<div class="layui-card-body">控制亮度 : 
								<div id="aiLamp1Progress" class="barProgress">
									<div id="aiLamp1Bar" class="oldBar"></div>
									<div id="aiLamp1newBar" class="newBar"></div>
								</div>
								<input type="text" class="barInput" id="aiLamp1SetValue">
								<button type="button" onclick="setAiLamp(1)" class="layui-btn layui-btn-sm layui-btn-normal">设置亮度</button>
							</div>
						</div>
					</div>
					<!-- 智能灯2 -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header queryFount" id="aiLamp2DeviceName"></div>
							<input type="hidden" id="aiLamp2DeviceId">
							<div class="layui-card-body">当前亮度 ： <span id="aiLamp2NowValue" class="queryFount"></span></div>
							<div class="layui-card-body">控制亮度 ：
								<div id="aiLamp2Progress" class="barProgress">
									<div id="aiLamp2Bar" class="oldBar"></div>
									<div id="aiLamp2newBar" class="newBar"></div>
								</div>
								<input type="text" class="barInput" value="0" id="aiLamp2SetValue">
								<button type="button" onclick="setAiLamp(2)" class="layui-btn layui-btn-sm layui-btn-normal">设置亮度</button>
							</div>
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
							<div class="layui-card-body">控制状态:
								<div class="layui-form-item">
									<label class="layui-form-label">开/关 : </label>
									<div class="layui-input-block">
										<input type="checkbox" id="lamp1SetStatus" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 普通灯2 -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<input type="hidden" id="lamp2DeviceId">
							<div class="layui-card-header queryFount" id="lamp2DeviceName"></div>
							<div class="layui-card-body">当前状态 : <span id="lamp2NowValue" class="queryFount"></span></div>
							<div class="layui-card-body">控制状态 : 
								<div class="layui-form-item">
									<label class="layui-form-label">开/关 : </label>
									<div class="layui-input-block">
										<input type="checkbox" id="lamp2SetStatus" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
									</div>
								</div>
							</div>
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
		var temperatureDom = document.getElementById("humidityChart");
		var humidityChart = echarts.init(temperatureDom);
		var temperatureDom = document.getElementById("temperatureChart");
		var temperatureChart = echarts.init(temperatureDom);
		
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
			//监听指定开关
			layui.form.on('switch(switchTest)', function(data) {
				var name = '';
				if(this.id === 'autoRefresh'){
					name = '自动刷新 ：';
					//开启/关闭自动刷新
				}
				
				else if(this.id === 'airConditionerSetStatus'){
					name = $('#airConditionerDeviceName').html() + ' : ';
					//控制空调开关
					produceInstruct('airConditioner', this.checked ? '1' : '0');
					
				}
				//门
				else if(this.id === 'doorSetStatus'){
					name = $('#doorDeviceName').html() + ' : ';
					produceInstruct('door', this.checked ? '1' : '0');
				}
				
				
				else if(this.id === 'lamp1SetStatus'){
					name = $('#lamp1DeviceName').html() + ' : ';
					produceInstruct('lamp1', this.checked ? '1' : '0');
				}
				
				else if(this.id === 'lamp2SetStatus'){
					name = $('#lamp2DeviceName').html() + ' : ';
					produceInstruct('lamp2', this.checked ? '1' : '0');
				}
			
				layer.msg(name + (this.checked ? '开启' : '关闭'), {
					offset : '80px'
				});
				
			});
			
			layui.use('form', function() {
				var form = layui.form;
				form.render();
			});

			$('#aiLampValue').bind('input propertychange', function() {
				$('#aiLampShowValue').val($('#aiLampValue').val());
			});
			//添加进度条
			new seekBar("aiLamp1SetValue", "aiLamp1Bar", "aiLamp1newBar", "aiLamp1Progress");
			new seekBar("aiLamp2SetValue", "aiLamp2Bar", "aiLamp2newBar", "aiLamp2Progress");
			queryDeviceValue();
		});

		//设置温度图表
		function setTemperatureChart(xData, yData) {
			var temperatureOption = {
				grid : {
					top : '4%',
					left : '3%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				xAxis : {
					type : 'category',
					data : xData
				},
				yAxis : {
					type : 'value'
				},
				series : [ {
					data : yData,
					type : 'line'
				} ]
			};
			if (temperatureOption && typeof temperatureOption === "object") {
				temperatureChart.setOption(temperatureOption, true);
			}
		}

		//设置湿度图表
		function setHumidityChart(xData, yData) {
			//湿度图表参数
			var humidityOption = {
				//边距
				grid : {
					top : '4%',
					left : '3%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				//x坐标
				xAxis : {
					type : 'category',
					data : xData
				},
				//y坐标
				yAxis : {
					type : 'value'
				},
				//值
				series : [ {
					data : yData,
					//类型 折线
					type : 'line'
				} ]
			};
			if (humidityOption && typeof humidityOption === 'object') {
				humidityChart.setOption(humidityOption, true);
			}
		}

		//查询所有设备值
		function queryDeviceValue() {
			$.ajax({
				//请求方式
				type : 'POST',
				//请求的媒体类型
				contentType : 'application/json;charset=UTF-8',
				async : false,
				//请求地址
				url : contextPath + '/server/queryDeviceValue.do',
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
									$('#lamp' + lampCount + 'setStatus').attr('checked', true);
								} else {
									$('#lamp' + lampCount + 'NowValue').html('关');
									$('#lamp' + lampCount + 'setStatus').attr('checked', false);
								}
								lampCount++;
							}

							//智能灯
							else if (result[i].deviceType === 'aiLamp') {
								$('#aiLamp' + aiLampCount + 'DeviceId').val(result[i].deviceId);
								$('#aiLamp' + aiLampCount + 'DeviceName').html(result[i].deviceName);
								$('#aiLamp' + aiLampCount + 'NowValue').html(result[i].deviceValue ? result[i].deviceValue : 0);
								$('#aiLamp' + aiLampCount + 'SetValue').val(result[i].deviceValue ? result[i].deviceValue : 0);
								//先让其得到焦点，然后再失去，触发值改变事件
								$('#aiLamp' + aiLampCount + 'SetValue').focus();
								$('#hiddenInput').focus();
								aiLampCount++;
							}

							//门
							else if (result[i].deviceType === 'door') {
								$('#doorDeviceId').val(
										result[i].deviceId);
								$('#doorDeviceName').html(
										result[i].deviceName);
								if (result[i].deviceValue == '1') {
									$('#doorNowValue').html('开');
									//设置状态
									$('#doorSetStatus').attr('checked',true);
								} else {
									$('#doorNowValue').html('关');
									//设置状态
									$('#doorSetStatus').attr('checked',false);
								}
							}

							//空调
							else if (result[i].deviceType === 'airConditioner') {
								$('#airConditionerDeviceId').val(result[i].deviceId);
								$('#airConditionerDeviceName').html(result[i].deviceName);
								if (result[i].deviceValue == '1') {
									//当前状态
									$('#airConditionerNowStatus').html('开');
									//设置状态
									$('#airConditionerSetStatus').attr('checked',true);
									
								} else {
									$('#airConditionerNowStatus').html('关');
									//设置状态
									$('#airConditionerSetStatus').attr('checked',false);
								}
								//模式
								$('#airConditionerMode').html(getAirConditionerMode(result[i].airConditionerMode));
								//风速
								$('#airConditionerWindSpeed').html(getAirConditionerWindSpeed(result[i].airConditionerWindSpeed));
								$('#airConditionerTemperature').html(result[i].airConditionerTemperature);
								
								//模式
								$('#airConditionerSetMode').val(result[i].airConditionerMode);
								//风速
								$('#airConditionerSetWindSpeed').val(result[i].airConditionerWindSpeed);
								$('#airConditionerSetTemperature').val(result[i].airConditionerTemperature);
								
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
			
			
			//查询温度历史数据
			$.ajax({
				//请求方式
				type : 'POST',
				//请求的媒体类型
				contentType : 'application/json;charset=UTF-8',
				//请求地址
				url : contextPath + '/server/queryHistoryTemperature.do',
				//数据，json字符串
				data : JSON.stringify({
					'temperatureDeviceId' : $('#temperatureDeviceId').val()
				}),
				//请求成功
				success : function(result) {
					var xData = [];
					var yData = [];
					if(result){
						for(var i=0; i<result.length; i++){
							yData.push(result[i].temperatureValue);
							xData.push(result[i].temperatureTime);
						}
						setTemperatureChart(xData, yData);
					}
				},
				//请求失败，包含具体的错误信息
				error : function(e) {
					console.log(e.status);
					console.log(e.responseText);
				}
			});
			var humidityDeviceId = $('#humidityDeviceId').val();
			//查询湿度历史数据
			$.ajax({
				//请求方式
				type : 'POST',
				//请求的媒体类型
				contentType : 'application/json;charset=UTF-8',
				//请求地址
				url : contextPath + '/server/queryHistoryHumidity.do',
				//数据，json字符串
				data : JSON.stringify({
					'humidityDeviceId' : humidityDeviceId
				}),
				//请求成功
				success : function(result) {
					var xData = [];
					var yData = [];
					if(result){
						for(var i=0; i<result.length; i++){
							yData.push(result[i].humidityValue);
							xData.push(result[i].humidityTime);
						}
						setHumidityChart(xData, yData);
					}
					
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
		//设置灯亮度
		function setAiLamp(num){
			produceInstruct('aiLamp' + num , 1);
			
		}
		

		//生成指令   并调用控制设备方法
		function produceInstruct(deviceType, action) {
			var instruct = {};
			var deviceId = '';
			if(deviceType === 'airConditioner'){
				deviceId = $('#airConditionerDeviceId').val();
				instruct = {
					'airConditionerMode' : $('#airConditionerSetMode').val(),
					'airConditionerWindSpeed' : $('#airConditionerSetWindSpeed').val(),
					'airConditionerTemperature' : $('#airConditionerSetTemperature').val(),
					'airConditionerStatus' : action + ''
				 };
			}
			
			else if(deviceType === 'door'){
				deviceId = $('#doorDeviceId').val();
				var deviceValue = $('#deviceSetStatus').val();
				instruct = {
					'doorStatus' : action + ''
				 };
			}
			else if(deviceType === 'door'){
				deviceId = $('#doorDeviceId').val();
				instruct = {
					'doorStatus' : action + ''
				 };
			}
			else if(deviceType === 'aiLamp1'){
				deviceId = $('#aiLamp1DeviceId').val();
				instruct = {
					'lampStatus' : action + '',
					'lampLighting' : $('#aiLamp1SetValue').val(),
					'lampType' : '1'
				 };
				deviceType = 'lamp'
			}
			else if(deviceType === 'aiLamp2'){
				deviceId = $('#aiLamp2DeviceId').val();
				instruct = {
					'lampStatus' : action + '',
					'lampLighting' : $('#aiLamp2SetValue').val(),
					'lampType' : '1'
				 };
				deviceType = 'lamp'
			}
			else if(deviceType === 'lamp1'){
				deviceId = $('#lamp1DeviceId').val();
				instruct = {
					'lampStatus' : action + '',
					'lampLighting' : 0,
					'lampType' : '0'
				 };
				deviceType = 'lamp'
			}
			else if(deviceType === 'lamp2'){
				deviceId = $('#lamp2DeviceId').val();
				instruct = {
					'lampStatus' : action + '',
					'lampLighting' : 0,
					'lampType' : '0'
				 };
				deviceType = 'lamp'
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
				url : contextPath + '/server/controlDevice.do',
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
