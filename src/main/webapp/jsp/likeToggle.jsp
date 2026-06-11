<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.LikeDAO" %>
<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        out.print("<script>alert('로그인이 필요합니다.'); location.href='../html/login.html';</script>");
        return;
    }

    int feedNo = 0;
    try {
        feedNo = Integer.parseInt(request.getParameter("no"));
    } catch (Exception e) {
        response.sendRedirect("main.jsp");
        return;
    }

    String redirect = request.getParameter("redirect");
    if (redirect == null || redirect.trim().equals("")) redirect = "main.jsp";

    try {
        (new LikeDAO()).toggle(feedNo, uid);
        response.sendRedirect(redirect);
    } catch (Exception e) {
        out.print("<script>alert('추천 처리 중 오류가 발생했습니다.'); history.back();</script>");
    }
%>
