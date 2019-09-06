package site.zaraportfolio.util;

import java.io.File;
import java.io.IOException;

public class FileRenamePolicy {
	
	public static File rename(File file) {
		if(createNewFile(file)) return file;
		
		String name = file.getName();
		String body = null;
		String ext = null;
		
		int dot = name.lastIndexOf(".");
		if(dot != -1) {
			body = name.substring(0,dot);
			ext = name.substring(dot);
		}else {
			body = name;
			ext = "";
		}
		
		int count = 0;
		
		while(!createNewFile(file) && count<9999) {
			count++;
			String newName = body + count + ext;
			file = new File(file.getParent(),newName);
		}
		
		return file;
	}
	
	private static boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		}catch(IOException ignored) {
			return false;
		}
	}
	
}
