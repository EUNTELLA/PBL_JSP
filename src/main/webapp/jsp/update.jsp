<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="util.FileUtil" %>
<%@ page import="java.util.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String uid = (String) session.getAttribute("id");

    if (uid == null) {
        out.print("<script>alert('로그인이 필요합니다.'); location.href='../html/login.html';</script>");
        return;
    }

    String upass = null;
    String upass2 = null;
    String uname = null;
    String ubio = null;
    String profileImage = null;

    try {
        ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
        List items = sfu.parseRequest(request);
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            String name = item.getFieldName();
            if (item.isFormField()) {
                String value = item.getString("utf-8");
                if (name.equals("ps")) upass = value;
                else if (name.equals("ps2")) upass2 = value;
                else if (name.equals("name")) uname = value;
                else if (name.equals("bio")) ubio = value;
            } else if (name.equals("profileImage")) {
                String originalName = item.getName();
                if (originalName != null && !originalName.trim().equals("")) {
                    Path p = Paths.get(originalName);
                    profileImage = FileUtil.safeFileName(uid, p.getFileName().toString());
                    String root = application.getRealPath(java.io.File.separator);
                    FileUtil.saveImage(root, profileImage, item.get());
                }
            }
        }

        if (upass != null && !upass.equals(upass2)) {
            out.print("<script>alert('패스워드가 일치하지 않습니다.'); history.back();</script>");
            return;
        }

        UserDAO dao = new UserDAO();
        boolean isSuccess = dao.update(uid, upass, uname, ubio, profileImage);
        if (isSuccess) {
            out.print("<script>alert('정보가 성공적으로 수정되었습니다.'); location.href='main.jsp';</script>");
        } else {
            out.print("<script>alert('정보 수정에 실패했습니다.'); history.back();</script>");
        }
    } catch (Exception e) {
        out.print("<script>alert('정보 수정 중 오류가 발생했습니다.'); history.back();</script>");
    }
%>
