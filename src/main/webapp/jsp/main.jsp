<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList2();
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
	str += "<table align=center>";
	str += "<tr height=40><td><b>작성글 리스트</b></td>";
	str += "<td align=right>";
	str += "<a href='../html/feedAdd.html'><button>글쓰기</button></a>"; 
	str += "</td></tr>";

    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        if (img != null) {
            imgstr = "<img src='../images/" + img + "' width=240>";
        }
        str += "<tr><td colspan=2><hr></td></tr>";
        str += "<tr>";
        str += "<td><small>" + feed.getId() + "</small></td>";
        str += "<td><small>&nbsp;(" + feed.getTs() + ")</small></td>";
        str += "</tr>";
        str += "<tr><td colspan=2>" + imgstr + "</td></tr>";
        str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
    }
    str += "</table>";
    str += "</div>";
    out.print(str);
%>
