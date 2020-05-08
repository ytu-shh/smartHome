package com.ssm.server.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ssm.mqtt.MqttProducer;
import com.ssm.server.service.IServerService;

@Controller
@RequestMapping(value = "server")
public class ServerController {
	
	@Autowired
	private IServerService serverService;
	
	/**
	 * 查询所有设备当前状态和值
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/queryDeviceValue.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, Object>> queryDeviceValue(@RequestBody Map<String, Object> paramMap) {
		return serverService.queryDeviceValueByHomeId((String) paramMap.get("homeId"));
	}
	
	/**
	 * 查询历史温度-用于图表展示
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/queryHistoryTemperature.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, Object>> queryHistoryTemperature(@RequestBody Map<String, Object> paramMap) {
		String temperatureDeviceId = (String) paramMap.get("temperatureDeviceId");
		return serverService.queryHistoryTemperature(temperatureDeviceId);
	}

	/**
	 * 查询历史湿度-用于图表展示
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/queryHistoryHumidity.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, Object>> queryHistoryHumidity(@RequestBody Map<String, Object> paramMap) {
		String humidityDeviceId = (String) paramMap.get("humidityDeviceId");
		return serverService.queryHistoryHumidity(humidityDeviceId);
	}
	
	/**
	 * 控制设备
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/controlDevice.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String controlDevice(@RequestBody Map<String, Object> paramMap) {
		String deviceType = (String) paramMap.get("deviceType");
		String homeId = (String) paramMap.get("homeId");
		String deviceId = (String) paramMap.get("deviceId");
		//Topic规则   smartHome/{deviceType}/{homeId}/{deviceId}
		String topic = "smartHome/" + deviceType + "/" + homeId + "/" + deviceId;
		String message = JSONObject.toJSONString(paramMap.get("instruct"));
		MqttProducer.sendMessage(topic, message);
		return "success";
	}
}
