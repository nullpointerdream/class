package com.hlk.util;

import java.util.Random;

public class TokenGenerator {
	
	private static final String BASE_GEN_STR = "abcdefghijkl0123456789mnopqrstuvwxyz";
	
	private static final String MOBILE_BASE_GEN_STR = "0123456789";
	
	/**
	 * 
	 * 生成用户访问码
	 * 
	 * 
	 * @param username
	 * @param password
	 * @param len
	 * @return
	 */
	public static final String genAccessToken(String username, String password, int len) {
		return genRandomString(username + password, len);
	}
	
	
	/**
	 * 
	 * 根据指定的字符串生成指定长度的随机字符串
	 * 
	 * 未指定用于生成随机字符串的字符串
	 * 
	 * 默认就会使用0-9a-z
	 * 
	 * @param str
	 * @param len
	 * @return
	 */
	public static final String genRandomString(String str, int len) {
		StringBuilder sb = new StringBuilder();
		str = (str == null ? BASE_GEN_STR : str + BASE_GEN_STR);
		Random r = new Random();
		for (int i = 0; i < len; i++) {
			int num = r.nextInt(str.length());
			sb.append(str.charAt(num));
			str = str.replace((str.charAt(num) + ""), "");
		}
		return sb.toString();
    }
	
	public static final String genMobileCode(int len) {
		StringBuilder sb = new StringBuilder();
		Random r = new Random();
		for (int i = 0; i < len; i++) {
			int num = r.nextInt(MOBILE_BASE_GEN_STR.length());
			sb.append(MOBILE_BASE_GEN_STR.charAt(num));
		}
		return sb.toString();
	}
}
