# smartHome
智能家居，毕业设计，课程设计，物联网，MQTT，JavaWeb

## 开发环境
jdk1.8+tomcat8.5+mysql5.7

## 项目介绍
实现一个web应用，作为智能家居系统的服务端，接收来自客户端的数据，并能够通过web页面实时显示室内传感器的值，可以使用文本，建议使用曲线图；实现一个物联网客户端，模拟各种设备。客户端产生数据，发送至服务器，服务器根据协议对数据作出处理。  
需要模拟的设备有：  
温度传感器：数量1，采集房间温度信息。  
湿度传感器：数量1，采集房间湿度信息。  
空调：数量1，可以根据服务器发来的指令进行调节模式（制冷、制热、送风）、设置温度、风速；还可以根据服务器的指令上传子自己的当前状态：模式、温度、风速。  
灯光：数量4，两盏只能开关，两盏调光模式，调光范围0到100。  
门窗磁：可以根据服务器发来的指令打开或者关闭窗户。  
要求：  
1、设计通信协议完成数据的双向传输，应用层协议应包含首部和数据部分。  
2、数据传输方式使用mqtt协议，需要安装EMQ消息服务器。  
3、系统支持多客户端接入，在协议设计上能够区分来自不同客户端的消息，能够针对不同家庭进行控制设备。  
  

## 开始使用
将项目导入eclipse后  
修改文件src/applicationContext.xml  
```sh
	<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">  
		<property name="driverClassName" value="com.mysql.jdbc.Driver" />  
		<property name="url" value="jdbc:mysql://yourIp:3306/campushelp" />  
		<property name="username" value="yourName" />  
		<property name="password" value="yourPassword" />  
	</bean>  
```
  放入tomcat运行即可  
  
## 安装EMQX
https://docs.emqx.io/broker/latest/cn/getting-started/install.html
## 关注公众号【HelloWeb烟梦网络】留言问题，及时为你解答。
## 效果展示

![Image text](https://github.com/ytu-shh/images/blob/master/smartHome/client.png?raw=true)
![Image text](https://github.com/ytu-shh/images/blob/master/smartHome/server1.png?raw=true)
![Image text](https://github.com/ytu-shh/images/blob/master/smartHome/server2.png?raw=true)
![Image text](https://github.com/ytu-shh/images/blob/master/smartHome/server3.png?raw=true)
![Image text](https://github.com/ytu-shh/images/blob/master/smartHome/server4.png?raw=true)
![Image text](https://github.com/ytu-shh/images/blob/master/smartHome/emqx2.png?raw=true)

