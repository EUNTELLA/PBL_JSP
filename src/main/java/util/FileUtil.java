package util;

import java.io.*;

public class FileUtil {
    public static void saveImage(String root, String fname, byte[] data) throws IOException {
        if (fname == null || fname.trim().equals("")) return;
        root += "/images";
        File f = new File(root);
        if (!f.exists()) f.mkdirs();
		
        f = new File(root + "/" + fname);
        FileOutputStream out = new FileOutputStream(f);
        out.write(data);
        out.close();
    }
}
