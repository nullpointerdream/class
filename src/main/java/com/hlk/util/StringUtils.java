package com.hlk.util;

/**
 * GUAVA CACHE UTIL
 *
 * @author DH
 */
public final class StringUtils {

    public static boolean hasTest(String str) {
        if (str == null) {
            return false;
        }
        if ("".equals(str)) {
            return false;
        }
        if ("null".equals(str)) {
            return false;
        }
        return true;


    }

    public static boolean isNull(String str) {
        if (str == null) {
            return false;
        }
        return true;

    }

}
