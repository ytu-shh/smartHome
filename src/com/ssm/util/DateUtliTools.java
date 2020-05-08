package com.ssm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtliTools {
	public static final String SIMPLE_DATE_FORMAT = "yyyy-MM-dd";
	public static final String SIMPLE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	public static final String SIMPLE_15TIME_FORMAT = "yyyyMMdd HHmmss";
	/**
	 * Date类型转成String类型
	 * @param String simpleDateFormat, Date date
	 * @return Date
	 */
	public static String dateConvertString(String simpleDateFormat, Date date){
		SimpleDateFormat df =new SimpleDateFormat(simpleDateFormat);
        String strDate =df.format(date);
		return strDate;
	}
	
}
