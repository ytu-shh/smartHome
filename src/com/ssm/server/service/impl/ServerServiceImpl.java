package com.ssm.server.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.server.mapper.ServerMapper;
import com.ssm.server.service.IServerService;
@Service("serverService")
public class ServerServiceImpl implements IServerService{
	
	@Autowired ServerMapper serverMapper;

	@Override
	public int insertTemperature(Map<String, Object> pramMap) {
		return serverMapper.insertTemperature(pramMap);
	}

	@Override
	public int insertHumidity(Map<String, Object> pramMap) {
		return serverMapper.insertHumidity(pramMap);
	}


	@Override
	public List<Map<String, Object>> queryDeviceValueByHomeId(String homeId) {
		return serverMapper.queryDeviceValueByHomeId(homeId);
	}

	@Override
	public List<Map<String, Object>> queryHistoryTemperature(String temperatureDeviceId) {
		return serverMapper.queryHistoryTemperature(temperatureDeviceId);
	}

	@Override
	public List<Map<String, Object>> queryHistoryHumidity(String humidityDeviceId) {
		return serverMapper.queryHistoryHumidity(humidityDeviceId);
	}
	
	

}
