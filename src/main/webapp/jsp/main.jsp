<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
<meta charset="utf-8" />
<link rel="stylesheet" href="../css/core.css">
<title>MySNS - 메인</title>
</head>
<body>
    <div class="page-hdr">MySNS</div>
    <div class="page-body">
        <div class="menu-bar">
            <a href="../index.html">홈</a>
            <a href="main.jsp">피드</a>
            <a href="../html/feedAdd.html">글쓰기</a>
            <a href="../html/login.html">로그인</a>
            <a href="../html/signup.html">회원가입</a>
            <a href="edit.jsp">정보수정</a>
            <a href="../html/withdraw.html">회원탈퇴</a>
            <a href="userList.jsp">회원목록</a>
            <a href="logout.jsp">로그아웃</a>
        </div>
        <div class="section">
            <h2>Workflows</h2>
            <div class="feed-grid">
<%
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList2();
    if (feeds == null || feeds.isEmpty()) {
        out.print("<div class='feed-card'><div class='feed-content'>등록된 글이 없습니다.</div></div>");
    } else {
        for (FeedObj feed : feeds) {
            String img = feed.getImages();
            String imgstr = "";
            if (img != null && !img.trim().isEmpty()) {
                imgstr = "<div class='feed-img'><img src='../images/" + img + "' alt='Image'></div>";
            }
            out.print("<div class='feed-card'>");
            out.print("  <div class='feed-header'>");
            out.print("    <span class='feed-author'>" + feed.getId() + "</span>");
            out.print("    <span class='feed-time'>" + feed.getTs() + "</span>");
            out.print("  </div>");
            out.print(imgstr);
            out.print("  <div class='feed-content'>" + feed.getContent() + "</div>");
            out.print("</div>");
        }
    }
%>
            </div>
        </div>
    </div>
    <div class="page-footer">Copyright: mysns.com, 202x</div>
</body>
</html>
