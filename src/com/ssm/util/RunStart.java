package com.ssm.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.ssm.mqtt.SubscribeTopicThread;

/**
 * smartHome项目启动的时候执行的方法
 * @author shihonghao01
 *
 */
public class RunStart extends HttpServlet {

	private static final long serialVersionUID = -7827262224698296381L;

	// Servlet的init方法会在Tomcat启动的时候执行
	public void init() throws ServletException {
		// 启动线程订阅Topic
		new SubscribeTopicThread().run();
	}

}
