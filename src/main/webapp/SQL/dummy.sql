USE mysns;

INSERT INTO feed(id, title, content) VALUES("lee@abc.com", "프로젝트 회의록", "오늘 회의에서 게시판 UI와 댓글 기능을 점검했습니다.");
INSERT INTO feed(id, title, content) VALUES("kim@abc.com", "검색 기능 테스트", "제목, 내용, 작성자로 검색할 수 있는지 확인합니다.");
INSERT INTO feed(id, title, content) VALUES("kwon@abc.com", "페이징 더미 데이터 1", "게시글이 많아질 때 페이지가 나뉘는지 확인합니다.");
INSERT INTO feed(id, title, content) VALUES("lee@abc.com", "페이징 더미 데이터 2", "목록에서 10개씩 출력되는지 확인합니다.");
INSERT INTO feed(id, title, content) VALUES("kim@abc.com", "페이징 더미 데이터 3", "두 번째 페이지 이동을 테스트합니다.");
INSERT INTO feed(id, title, content) VALUES("kwon@abc.com", "페이징 더미 데이터 4", "댓글 수가 제목 옆에 표시됩니다.");
INSERT INTO feed(id, title, content) VALUES("lee@abc.com", "페이징 더미 데이터 5", "상세보기에서는 본문과 댓글을 확인합니다.");
INSERT INTO feed(id, title, content) VALUES("kim@abc.com", "페이징 더미 데이터 6", "수정과 삭제는 본인 글에서만 표시됩니다.");
INSERT INTO feed(id, title, content) VALUES("kwon@abc.com", "페이징 더미 데이터 7", "일반 게시판 형태의 정렬을 확인합니다.");
INSERT INTO feed(id, title, content) VALUES("lee@abc.com", "페이징 더미 데이터 8", "검색 결과에서도 페이징이 유지되는지 확인합니다.");
INSERT INTO feed(id, title, content) VALUES("kim@abc.com", "페이징 더미 데이터 9", "더미 게시글 마지막 항목입니다.");
INSERT INTO feed(id, title, content) VALUES("kwon@abc.com", "공지 테스트", "공지처럼 보이는 일반 게시글입니다.");

INSERT INTO reply(feed_no, id, content)
SELECT no, "lee@abc.com", "검색어 테스트 완료."
FROM feed
WHERE title = "검색 기능 테스트"
ORDER BY no DESC
LIMIT 1;

INSERT INTO reply(feed_no, id, content)
SELECT no, "kwon@abc.com", "회의록 감사합니다."
FROM feed
WHERE title = "프로젝트 회의록"
ORDER BY no DESC
LIMIT 1;

INSERT INTO reply(feed_no, id, content)
SELECT no, "kim@abc.com", "댓글 수 표시 확인."
FROM feed
WHERE title = "페이징 더미 데이터 4"
ORDER BY no DESC
LIMIT 1;

INSERT INTO reply(feed_no, id, content)
SELECT no, "kwon@abc.com", "상세보기에서 확인했습니다."
FROM feed
WHERE title = "페이징 더미 데이터 5"
ORDER BY no DESC
LIMIT 1;
