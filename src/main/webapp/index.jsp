<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%
    String uid = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
<meta charset="utf-8">
<link rel="stylesheet" href="css/core.css">
<title>MySNS</title>
</head>
<body>
    <div class="page-hdr">MySNS</div>
    <div class="page-body">
        <div class="menu-bar">
            <a href="index.jsp">홈</a>
            <a href="jsp/main.jsp">피드</a>
<% if (uid == null) { %>
            <a href="html/login.html">로그인</a>
            <a href="html/signup.html">회원가입</a>
<% } else { %>
            <a href="jsp/feedAddForm.jsp">글쓰기</a>
            <a href="jsp/edit.jsp">정보수정</a>
            <% if ("root@abc.com".equals(uid)) { %>
            <a href="jsp/userList.jsp">회원목록</a>
            <% } %>
            <a href="jsp/followingList.jsp">팔로우 목록</a>
            <a href="jsp/logout.jsp">로그아웃</a>
<% } %>
        </div>
        <div class="hero-section">
            <h1 class="hero-title">당신의 특별한 일상을<br>공유하세요</h1>
            <p class="hero-subtitle">MySNS에서 친구들과 소통하고, 새로운 사람들을 만나보세요.<br>지금 가입하고 당신만의 이야기를 기록해 보세요.</p>
            <div class="hero-buttons">
                <a href="jsp/main.jsp" class="hero-btn hero-btn-primary">피드 둘러보기</a>
                <a href="<%= uid == null ? "html/login.html" : "jsp/feedAddForm.jsp" %>" class="hero-btn hero-btn-secondary"><%= uid == null ? "로그인 / 가입" : "새 글 작성" %></a>
            </div>
        </div>
        <div class="section">
            <h2>My Workflows</h2>
            <div class="home-grid">
                <a class="home-card" href="jsp/main.jsp">
                    <strong>피드 보기</strong>
                    <span>등록된 글과 이미지를 카드 형태로 확인합니다.</span>
                </a>
<% if (uid == null) { %>
                <a class="home-card" href="html/login.html">
                    <strong>로그인</strong>
                    <span>계정으로 로그인하고 세션을 시작합니다.</span>
                </a>
                <a class="home-card" href="html/signup.html">
                    <strong>회원가입</strong>
                    <span>새 계정을 만들고 게시판 기능을 사용합니다.</span>
                </a>
<% } else { %>
                <a class="home-card" href="jsp/feedAddForm.jsp">
                    <strong>글쓰기</strong>
                    <span>새 게시글을 작성하고 이미지를 첨부합니다.</span>
                </a>
                <a class="home-card" href="jsp/followingList.jsp">
                    <strong>팔로우 목록</strong>
                    <span>내가 팔로우한 회원을 확인합니다.</span>
                </a>
                <% if ("root@abc.com".equals(uid)) { %>
                <a class="home-card" href="jsp/userList.jsp">
                    <strong>회원목록</strong>
                    <span>관리자 계정으로 전체 회원을 확인합니다.</span>
                </a>
                <% } %>
<% } %>
            </div>
        </div>
    </div>
    <div class="page-footer">Copyright: mysns.com, 2026</div>
</body>
</html>
