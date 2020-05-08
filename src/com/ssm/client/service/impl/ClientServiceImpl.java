package com.ssm.client.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.client.mapper.ClientMapper;
import com.ssm.client.service.IClientService;
@Service("clientService")
public class ClientServiceImpl implements IClientService{
	@Autowired 
	private ClientMapper clientMapper;

	@Override
	public int updateAirConditioner(Map<String, Object> pramMap) {
		//先看看能否修改成功
		int count = clientMapper.updateAirConditioner(pramMap);
		//如果修改数量为0，则说明还没有数据，再新增
		if (count == 0) {
			count = clientMapper.insertAirConditioner(pramMap);
		}
		return count;
	}

	@Override
	public int updateLamp(Map<String, Object> pramMap) {
		//先看看能否修改成功
		int count = clientMapper.updateLamp(pramMap);
		//如果修改数量为0，则说明还没有数据，再新增
		if (count == 0) {
			count = clientMapper.insertLamp(pramMap);
		}
		return count;
	}

	@Override
	public int updateDoor(Map<String, Object> pramMap) {
		//先看看能否修改成功
		int count = clientMapper.updateDoor(pramMap);
		//如果修改数量为0，则说明还没有数据，再新增
		if (count == 0) {
			count = clientMapper.insertDoor(pramMap);
		}
		return count;
	}

	@Override
	public int insertAirConditioner(Map<String, Object> pramMap) {
		return 0;
	}

	@Override
	public int insertLamp(Map<String, Object> pramMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertDoor(Map<String, Object> pramMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> queryDeviceValueByHomeId(String homeId) {
		return clientMapper.queryDeviceValueByHomeId(homeId);
	}


}
