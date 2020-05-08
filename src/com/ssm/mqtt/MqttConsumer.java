package com.ssm.mqtt;

import java.text.MessageFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

import com.alibaba.fastjson.JSONObject;
import com.ssm.client.service.IClientService;
import com.ssm.server.service.IServerService;
import com.ssm.util.SpringUtil;
import com.ssm.util.DateUtliTools;

/**
 * mqtt 消息消费者
 * 
 * @author shihonghao01
 * sdk文档https://docs.emqx.io/tutorial/latest/cn/client_dev/java.html
 */
public class MqttConsumer {
	
	/**
	 *  mqtt 订阅topic
	 */
	public static void subscribeTopic() {
		//mqtt消息中间件地址
		String broker = "tcp://127.0.0.1:1883";
		//设备id
		String clientId = "smartHomeConsumer";
		// Use the memory persistence
		MemoryPersistence persistence = new MemoryPersistence();

		try {
			MqttClient sampleClient = new MqttClient(broker, clientId, persistence);
			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setCleanSession(false);
			System.out.println("开始连接emqx:" + broker);
			sampleClient.connect(connOpts);
			System.out.println("完成连接");

			//Topic规则   smartHome/{deviceType}/{homeId}/{deviceId}
			String topic = "smartHome/+/+/+";
			System.out.println("订阅主题:" + topic);
			sampleClient.subscribe(topic, 2);
			//
			sampleClient.setCallback(new MqttCallback() {
				public void messageArrived(String topic, MqttMessage message) throws Exception {
					//用工具类处理消息，防止抛出异常后，导致连接断开
					MessageHandUtil.messageHand(topic, message);
				}

				public void deliveryComplete(IMqttDeliveryToken token) {
				}

				public void connectionLost(Throwable throwable) {
				}
			});
		} catch (MqttException me) {
			System.out.println("reason:" + me.getReasonCode());
			System.out.println("msg:" + me.getMessage());
			System.out.println("loc:" + me.getLocalizedMessage());
			System.out.println("cause:" + me.getCause());
			System.out.println("excep:" + me);
			me.printStackTrace();
		}

	}
	
	public static void main(String[] args) {
		subscribeTopic();
	}
}
