<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%
    // 세션에서 로그인한 사용자 아이디 가져오기
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        out.print("<script>alert('로그인이 필요합니다.'); location.href='../html/login.html';</script>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
<meta charset="utf-8" />
<link rel="stylesheet" href="../css/core.css">
<title>MySNS - 정보 수정</title>
</head>
<body>
<form action="update.jsp" method="post" enctype="multipart/form-data">
    <div class="page-hdr">MySNS</div>
    <div class="page-body">
        <div class="menu-bar">
            <a href="../index.jsp">홈</a>
            <a href="main.jsp">피드</a>
            <a href="../html/feedAdd.html">글쓰기</a>
            <a href="edit.jsp">정보수정</a>
            <a href="userList.jsp">회원목록</a>
            <a href="logout.jsp">로그아웃</a>
        </div>
        <div class="section">
            <h2>정보수정</h2>
            <div class="desc">
                <b><%= uid %></b>님의 정보를 수정합니다.<br>
                변경할 패스워드와 이름을 입력해주세요.
            </div>
            <input name="ps" type="password" placeholder="새 패스워드" required>
            <input name="ps2" type="password" placeholder="새 패스워드 (확인)" required>
            <input name="name" type="text" placeholder="새 이름">
            <textarea name="bio" class="mtop-10" placeholder="새 소개"></textarea>
            <label class="file-label mtop-10">프로필 이미지</label>
            <input name="profileImage" type="file" accept="image/*">
            <input type="submit" value="정보 수정하기"> 
        </div>
        <div class="section mtop-30">
            <h2>회원탈퇴</h2>
            <div class="desc">현재 로그인된 <b><%= uid %></b> 계정을 탈퇴합니다.</div>
            <a class="button danger-button" href="withdraw.jsp" onclick="return confirm('정말 회원탈퇴 하시겠습니까?');">회원탈퇴하기</a>
        </div>
    </div>
    <div class="page-footer">© 202x MySNS from GCA</div>
</form>
</body>
</html>
