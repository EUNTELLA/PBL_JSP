package util;

public class ProfileUtil {
    public static String resolveImage(String uid, String profileImage) {
        if ("kim@abc.com".equals(uid))
            return "profile1.jpg";
        if ("lee@abc.com".equals(uid))
            return "profile2.jpg";
        if ("kwon@abc.com".equals(uid))
            return "profile3.jpg";
        if ("root@abc.com".equals(uid))
            return "rootprofile.jpg";
        return profileImage;
    }
}
