package dao;

public class FeedObj {
    private int no, replyCount;
    private String id, title, content, ts, images, authorName;
	
    public FeedObj(int no, String id, String title, String content, String ts, String images) {
        this(no, id, title, content, ts, images, null, 0);
    }

    public FeedObj(int no, String id, String title, String content, String ts, String images, String authorName, int replyCount) {
        this.no = no;
        this.id = id;
        this.title = title;
        this.content = content;
        this.ts = ts;
        this.images = images;
        this.authorName = authorName;
        this.replyCount = replyCount;
    }

    public int getNo() { return this.no; }
    public int getReplyCount() { return this.replyCount; }
    public String getId() { return this.id; }
    public String getTitle() { return this.title; }
    public String getContent() { return this.content; }
    public String getTs() { return this.ts; }
    public String getImages() { return this.images; }
    public String getAuthorName() { return this.authorName; }
}
