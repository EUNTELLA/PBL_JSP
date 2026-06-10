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
<link rel="stylesheet" href="../html/css/core.css">
<title>MySNS - 정보 수정</title>
<style>
.desc {
    float: left;
    width: 100%;
    color: #888;
    font-size: 0.9em;
}
</style>
</head>
<body>
<form action="update.jsp" method="post">
    <div class="page-hdr">MySNS</div>
    <div class="page-body">
        <div class="section pad-24 mtop-30">
            <div class="desc mbot-20">
                <b><%= uid %></b>님의 정보를 수정합니다.<br>
                변경할 패스워드와 이름을 입력해주세요.
            </div>
            <input name="ps" type="password" class="mtop-10" placeholder="새 패스워드" required>
            <input name="ps2" type="password" class="mtop-10" placeholder="새 패스워드 (확인)" required>
            <input name="name" type="text" class="mtop-10" placeholder="새 이름">
            <input type="submit" class="mtop-20" value="정보 수정하기"> 
        </div>
    </div>
    <div class="page-footer">Copyright: mysns.com, 202x</div>
</form>
</body>
</html>