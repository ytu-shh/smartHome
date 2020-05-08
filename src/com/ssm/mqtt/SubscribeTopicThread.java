package com.ssm.mqtt;
/**
 * mqtt 单启线程订阅Topic
 * @author shihonghao01
 *
 */
public class SubscribeTopicThread extends Thread{
	public void run() { 
		//多线程使用mqtt消费者订阅Topic 接收消息
		MqttConsumer.subscribeTopic();
	}
}
