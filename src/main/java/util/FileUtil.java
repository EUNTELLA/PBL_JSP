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

    public static String safeFileName(String uid, String fname) {
        if (fname == null || fname.trim().equals("")) return null;
        String cleanUid = uid.replaceAll("[^a-zA-Z0-9]", "_");
        String cleanName = new File(fname).getName().replaceAll("[^a-zA-Z0-9._-]", "_");
        return cleanUid + "_" + System.currentTimeMillis() + "_" + cleanName;
    }
}
