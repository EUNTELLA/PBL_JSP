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
<style>
body { font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif; background-color: #fafafa; margin: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
form { background: white; border: 1px solid #dbdbdb; border-radius: 8px; width: 100%; max-width: 380px; padding: 40px 30px; box-sizing: border-box; box-shadow: 0 4px 12px rgba(0,0,0,0.05); margin: 20px; }
.page-hdr { font-size: 2.2em; font-weight: bold; text-align: center; margin-bottom: 20px; color: #262626; font-family: 'Brush Script MT', cursive, sans-serif; font-style: italic; }
.desc {
    float: left;
    width: 100%;
    color: #888;
    font-size: 0.9em;
    color: #8e8e8e;
    font-size: 0.95em;
    text-align: center;
    margin-bottom: 25px;
    line-height: 1.5;
}
.desc b { color: #262626; }
input[type="text"], input[type="password"] { width: 100%; padding: 14px 12px; margin-bottom: 12px; border: 1px solid #dbdbdb; border-radius: 4px; box-sizing: border-box; background-color: #fafafa; font-size: 0.9em; }
input[type="text"]:focus, input[type="password"]:focus { outline: none; border-color: #a8a8a8; }
input[type="submit"] { width: 100%; padding: 12px; background-color: #0095f6; color: white; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; font-size: 0.95em; transition: background 0.2s; margin-top: 10px; }
input[type="submit"]:hover { background-color: #007bb5; }
.page-footer { text-align: center; color: #8e8e8e; font-size: 0.8em; margin-top: 25px; }
</style>
</head>
<body>
<form action="update.jsp" method="post">
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
            <div class="desc">
                <b><%= uid %></b>님의 정보를 수정합니다.<br>
                변경할 패스워드와 이름을 입력해주세요.
            </div>
            <input name="ps" type="password" placeholder="새 패스워드" required>
            <input name="ps2" type="password" placeholder="새 패스워드 (확인)" required>
            <input name="name" type="text" placeholder="새 이름">
            <input type="submit" value="정보 수정하기"> 
        </div>
    </div>
    <div class="page-footer">© 202x MySNS from GCA</div>
</form>
</body>
</html>
