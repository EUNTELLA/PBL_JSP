<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%
    request.setCharacterEncoding("utf-8");

    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        out.print("<script>alert('로그인이 필요합니다.'); location.href='../html/login.html';</script>");
        return;
    }

    int no = 0;
    try {
        no = Integer.parseInt(request.getParameter("no"));
    } catch (Exception e) {
        out.print("<script>alert('잘못된 게시글입니다.'); location.href='main.jsp';</script>");
        return;
    }

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    if (title == null || title.trim().equals("") || content == null || content.trim().equals("")) {
        out.print("<script>alert('제목과 내용을 입력해주세요.'); history.back();</script>");
        return;
    }

    if ((new FeedDAO()).update(no, uid, title, content)) {
        response.sendRedirect("main.jsp");
    } else {
        out.print("<script>alert('수정 권한이 없거나 게시글이 없습니다.'); location.href='main.jsp';</script>");
    }
%>
