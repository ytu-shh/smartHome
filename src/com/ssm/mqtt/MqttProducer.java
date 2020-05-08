package com.ssm.mqtt;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

/**
 * mqtt 生产者  发送消息
 * @author shihonghao01
 * sdk文档https://docs.emqx.io/tutorial/latest/cn/client_dev/java.html
 *
 */
public class MqttProducer {
	
	/**
	 * 发送MQTT消息
	 * @param topic
	 * @param message
	 * @return
	 */
	public static boolean sendMessage(String topic, String message) {
		//mqtt消息中间件地址
		String broker = "tcp://127.0.0.1:1883";
		//设备id
		String clientId = "smartHomeProducer";
		MemoryPersistence persistence = new MemoryPersistence();
		try {
			MqttClient sampleClient = new MqttClient(broker, clientId, persistence);
			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setCleanSession(true);
			sampleClient.connect(connOpts);
			//消息质量
			int qos = 2;
			//生成 message对象
			MqttMessage mqttMessage = new MqttMessage(message.getBytes());
			//设置消息质量
			mqttMessage.setQos(qos);
			//发送消息
			sampleClient.publish(topic, mqttMessage);
			
			System.out.println("发送消息: topic=" + topic + ", mqttMessage=" + mqttMessage);
			//关闭连接
			sampleClient.disconnect();
			//关闭资源
			sampleClient.close();

		} catch (MqttException me) {
			System.out.println("reason:" + me.getReasonCode());
			System.out.println("msg:" + me.getMessage());
			System.out.println("loc:" + me.getLocalizedMessage());
			System.out.println("cause:" + me.getCause());
			System.out.println("excep:" + me);
			me.printStackTrace();
		}
		return true;
	}
	
	public static void main(String[] args) {
		sendMessage("topic", "123");
	}

}
