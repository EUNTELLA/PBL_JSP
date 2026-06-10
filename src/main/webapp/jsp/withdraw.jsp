<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
  String uid = (String) session.getAttribute("id");
  if (uid == null) {
      out.print("<script>alert('로그인이 필요합니다.'); location.href='../html/login.html';</script>");
      return;
  }

  UserDAO dao = new UserDAO();
  if (dao.exists(uid) == false) {
      out.print("회원 정보를 찾을 수 없습니다.");
      return;
  }
  if (dao.delete(uid)) {
      session.invalidate();
      out.print("<script>alert('회원 탈퇴가 완료되었습니다.'); location.href='../index.html';</script>");
  }
  else {
      out.print("회원 탈퇴 처리 중 오류가 발생하였습니다.");
  }
%>
