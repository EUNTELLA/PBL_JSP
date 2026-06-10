<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%
    String uid = (String) session.getAttribute("id");
	//Class.forName("com.mysql.jdbc.Driver");
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "1111");
	Connection conn = ConnectionPool.get();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT id, name, bio, ts FROM user");
    String str = "<link rel='stylesheet' href='../css/core.css'>";
    str += "<div class='page-hdr'>MySNS</div>";
    str += "<div class='page-body'>";
    str += "<div class='menu-bar'>";
    str += "<a href='../index.html'>홈</a>";
    str += "<a href='main.jsp'>피드</a>";
    if (uid == null) {
        str += "<a href='../html/login.html'>로그인</a>";
        str += "<a href='../html/signup.html'>회원가입</a>";
    } else {
        str += "<a href='../html/feedAdd.html'>글쓰기</a>";
        str += "<a href='edit.jsp'>정보수정</a>";
        str += "<a href='userList.jsp'>회원목록</a>";
        str += "<a href='logout.jsp'>로그아웃</a>";
    }
    str += "</div>";
    str += "<div class='section'>";
    str += "<h2>회원목록</h2>";
    str += "<table class='data-table'>";
    str += "<tr><th>아이디</th><th>이름</th><th>소개</th><th>가입일</th></tr>";
    while(rs.next()) {
        str += "<tr>";
        str += "<td>" + rs.getString("id") + "</td>";
        str += "<td>" + rs.getString("name") + "</td>";
        str += "<td>" + rs.getString("bio") + "</td>";
        str += "<td>" + rs.getString("ts") + "</td>";
        str += "</tr>";
    }
    str += "</table>";
    str += "</div>";
    str += "</div>";
    out.print(str);
    rs.close(); stmt.close(); conn.close();
%>
