package com.ssm.server.mapper;

import java.util.List;
import java.util.Map;

public interface ServerMapper {
	
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
	 * 插入空调值
	 * @param pramMap
	 * @return
	 */
	public int insertAirConditioner(Map<String, Object> pramMap);
	
	
	/**
	 * 插入灯值
	 * @param pramMap
	 * @return
	 */
	public int insertLamp(Map<String, Object> pramMap);
	
	
	/**
	 * 插入门状态
	 * @param pramMap
	 * @return
	 */
	public int insertDoor(Map<String, Object> pramMap);
	
	
	/**
	 * 修改空调值
	 * @param pramMap
	 * @return
	 */
	public int updateAirConditioner(Map<String, Object> pramMap);
	
	/**
	 * 修改灯值
	 * @param pramMap
	 * @return
	 */
	public int updateLamp(Map<String, Object> pramMap);
	
	/**
	 * 修改门状态
	 * @param pramMap
	 * @return
	 */
	public int updateDoor(Map<String, Object> pramMap);
	
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
