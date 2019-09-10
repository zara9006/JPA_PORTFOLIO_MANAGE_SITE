package site.zaraportfolio.util;

import java.security.MessageDigest;

public class Encrypt {

	public static String encryptSHA25(String str) throws Exception{
		StringBuffer hexString = new StringBuffer();
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(str.getBytes("UTF-8"));
		
		for (int i = 0; i < hash.length; i++) {
			String hex = Integer.toHexString(0xff & hash[i]);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}
		return hexString.toString();
	}
	
	public static String encryptMD5(String str) throws Exception {
		StringBuffer hexString = new StringBuffer();
	     
	    MessageDigest mDigest = MessageDigest.getInstance("MD5");
	    mDigest.update(str.getBytes());     
	    byte[] hash = mDigest.digest() ;
	    for(int i=0; i < hash.length; i++){
	        String hex = Integer.toHexString((int)hash[i] & 0x00ff) ;          
	        hexString.append(hex) ;
	    }
	     
	    return hexString.toString() ;
	}

}
