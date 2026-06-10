<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%
    session.invalidate();
    String str = "<link rel='stylesheet' href='../css/core.css'>";
    str += "<div class='page-hdr'>MySNS</div>";
    str += "<div class='page-body'>";
    str += "<div class='menu-bar'>";
    str += "<a href='../index.html'>홈</a>";
    str += "<a href='main.jsp'>피드</a>";
    str += "<a href='../html/feedAdd.html'>글쓰기</a>";
    str += "<a href='../html/login.html'>로그인</a>";
    str += "<a href='../html/signup.html'>회원가입</a>";
    str += "<a href='edit.jsp'>정보수정</a>";
    str += "<a href='../html/withdraw.html'>회원탈퇴</a>";
    str += "<a href='userList.jsp'>회원목록</a>";
    str += "<a href='logout.jsp'>로그아웃</a>";
    str += "</div>";
    str += "<div class='section'><h2>로그아웃</h2><p>로그아웃 하였습니다.</p></div>";
    str += "</div>";
   	out.print(str);
%>
