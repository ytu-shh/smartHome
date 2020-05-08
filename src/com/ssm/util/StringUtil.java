package com.ssm.util;

public class StringUtil {
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if(str != null && !str.replace(" ", "").equals("")){
			return false;
		}
		else {
			return true;
		}
	}
}
