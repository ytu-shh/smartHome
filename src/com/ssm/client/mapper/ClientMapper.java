package com.ssm.client.mapper;

import java.util.List;
import java.util.Map;

public interface ClientMapper {
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
	 * 通过家庭编号查询设备值
	 * @param homeId
	 * @return
	 */
	public List<Map<String, Object>> queryDeviceValueByHomeId(String homeId);
}
