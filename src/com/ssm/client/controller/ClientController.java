package com.ssm.client.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ssm.client.service.IClientService;
import com.ssm.mqtt.MqttProducer;

@Controller
@RequestMapping(value = "client")
public class ClientController {
	
	@Autowired
	IClientService clientService;
	

	/**
	 * 查询所有设备状态和值
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = "/queryDeviceValue.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, Object>> queryDeviceValue(@RequestBody Map<String, Object> paramMap) {
		return clientService.queryDeviceValueByHomeId((String) paramMap.get("homeId"));
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
