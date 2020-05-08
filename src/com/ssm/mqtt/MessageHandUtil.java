package com.ssm.mqtt;
/**
 * 消息处理
 */
import java.text.MessageFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import org.eclipse.paho.client.mqttv3.MqttMessage;

import com.alibaba.fastjson.JSONObject;
import com.ssm.client.service.IClientService;
import com.ssm.server.service.IServerService;
import com.ssm.util.DateUtliTools;
import com.ssm.util.SpringUtil;

public class MessageHandUtil {
	private static IClientService getClientService() {
		return SpringUtil.getBean(IClientService.class);
	}
	
	private static IServerService getServerService() {
		return SpringUtil.getBean(IServerService.class);
	}
	
	public static void messageHand(String topic, MqttMessage message) {
		try {
			String[] topicList = topic.split("/");
			String deviceType = topicList[1];
			String deviceId = topicList[3];
			
			Map<String, Object> pramMap = JSONObject.parseObject(new String(message.getPayload()));
			pramMap.put("deviceId", deviceId);
			pramMap.put("time", DateUtliTools.dateConvertString(DateUtliTools.SIMPLE_15TIME_FORMAT, new Date()));
			pramMap.put("uuid", UUID.randomUUID().toString().replace("-", ""));
			
			if("temperature".equals(deviceType)) {
				getServerService().insertTemperature(pramMap);
			}
			else if("humidity".equals(deviceType)) {
				getServerService().insertHumidity(pramMap);
			}
			else if("airConditioner".equals(deviceType)) {
				getClientService().updateAirConditioner(pramMap);
									
			}
			else if("lamp".equals(deviceType)) {
				getClientService().updateLamp(pramMap);
			}
			else if("door".equals(deviceType)) {
				getClientService().updateDoor(pramMap);
			}
			
			String theMsg = MessageFormat.format("{0} is arrived for topic {1}.",
					new String(message.getPayload()), topic);
			System.out.println("收到消息:" + theMsg);
			
		} catch (Exception e) {
			e.printStackTrace();
			return ;
		}
		
	}

}
