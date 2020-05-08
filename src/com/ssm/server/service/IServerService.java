package com.ssm.server.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


public interface IServerService {
	
	/**
	 * 插入温度
	 * @param pramMap
	 * @return
	 */
	public int insertTemperature(Map<String, Object> pramMap);

	/**
	 * 插入湿度
	 * @param pramMap
	 * @return
	 */
	public int insertHumidity(Map<String, Object> pramMap);
	
	
	/**
	 * 通过家庭编号查询设备值
	 * @param homeId
	 * @return
	 */
	public List<Map<String, Object>> queryDeviceValueByHomeId(String homeId);
	
	/**
	 * 查询历史温度   最新20条
	 * @return
	 */
	public List<Map<String, Object>> queryHistoryTemperature(String temperatureDeviceId);
	
	
	/**
	 * 查询历史湿度   最新20条
	 * @return
	 */
	public List<Map<String, Object>> queryHistoryHumidity(String humidityDeviceId);

}
