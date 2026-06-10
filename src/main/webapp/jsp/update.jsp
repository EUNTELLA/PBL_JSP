<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
    request.setCharacterEncoding("utf-8");
    String uid = (String) session.getAttribute("id");
    
    // 세션 체크
    if (uid == null) {
        out.print("<script>alert('로그인이 필요합니다.'); location.href='../html/login.html';</script>");
        return;
    }

    String upass = request.getParameter("ps");
    String upass2 = request.getParameter("ps2");
    String uname = request.getParameter("name");
    String ubio = request.getParameter("bio");
    
    // 비밀번호 확인 검증
    if (upass != null && !upass.equals(upass2)) {
        out.print("<script>alert('패스워드가 일치하지 않습니다.'); history.back();</script>");
        return;
    }

    UserDAO dao = new UserDAO();
    try {
        boolean isSuccess = dao.update(uid, upass, uname, ubio); 
        if (isSuccess) {
            out.print("<script>alert('정보가 성공적으로 수정되었습니다.'); location.href='main.jsp';</script>");
        } else {
            out.print("<script>alert('정보 수정에 실패했습니다.'); history.back();</script>");
        }
    } catch (Exception e) {
        out.print("<script>alert('정보 수정 중 데이터베이스 오류가 발생했습니다.'); history.back();</script>");
    }
%>
