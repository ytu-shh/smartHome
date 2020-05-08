# smartHome
智能家居，毕业设计，课程设计，物联网，MQTT，JavaWeb

## 开发环境
jdk1.8+tomcat8.5+mysql5.7
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
## 关注公众号【HelloWeb烟梦网络】留言问题，及时为你解答。
## 效果展示
