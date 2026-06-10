<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
<meta charset="utf-8" />
<title>MySNS - 메인</title>
<style>
    body { font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif; background-color: #fafafa; margin: 0; padding: 0; }
    .header { background-color: #fff; padding: 15px 20px; border-bottom: 1px solid #dbdbdb; display: flex; justify-content: space-between; align-items: center; position: sticky; top: 0; z-index: 100; box-shadow: 0 1px 3px rgba(0,0,0,0.02); }
    .header h2 { margin: 0; font-size: 1.5em; color: #262626; font-family: 'Brush Script MT', cursive, sans-serif; font-style: italic; }
    .btn-write { background-color: #0095f6; color: white; border: none; padding: 8px 16px; border-radius: 4px; font-weight: bold; cursor: pointer; text-decoration: none; font-size: 0.9em; transition: background 0.2s; }
    .btn-write:hover { background-color: #007bb5; }
    .nav-links a { text-decoration: none; color: #262626; margin-right: 15px; font-size: 0.9em; font-weight: 600; }
    .nav-links a:hover { color: #8e8e8e; }
    .container { max-width: 470px; margin: 30px auto; padding: 0 15px; }
    .feed-card { background-color: #fff; border: 1px solid #dbdbdb; border-radius: 8px; margin-bottom: 25px; overflow: hidden; }
    .feed-header { padding: 14px; border-bottom: 1px solid #efefef; display: flex; justify-content: space-between; align-items: center; }
    .feed-author { font-weight: bold; color: #262626; font-size: 0.95em; }
    .feed-time { font-size: 0.8em; color: #8e8e8e; }
    .feed-img img { width: 100%; display: block; }
    .feed-content { padding: 14px; font-size: 0.95em; color: #262626; line-height: 1.5; }
    .empty-msg { text-align: center; color: #8e8e8e; padding: 50px 0; }
</style>
</head>
<body>
    <div class="header">
        <h2>MySNS</h2>
        <div class="nav-links">
            <a href="edit.jsp">정보 수정</a>
            <a href="../html/feedAdd.html" class="btn-write">새 글 작성</a>
        </div>
    </div>
    <div class="container">
<%
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList2();
    if (feeds == null || feeds.isEmpty()) {
        out.print("<div class='feed-card'><div class='empty-msg'>등록된 글이 없습니다.</div></div>");
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
</body>
</html>
