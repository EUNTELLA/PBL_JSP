package dao;

public class FeedObj {
    private int no, replyCount, likeCount;
    private String id, title, content, ts, images, authorName, authorProfileImage;
	
    public FeedObj(int no, String id, String title, String content, String ts, String images) {
        this(no, id, title, content, ts, images, null, 0, 0, null);
    }

    public FeedObj(int no, String id, String title, String content, String ts, String images, String authorName, int replyCount) {
        this(no, id, title, content, ts, images, authorName, replyCount, 0, null);
    }

    public FeedObj(int no, String id, String title, String content, String ts, String images, String authorName, int replyCount, int likeCount, String authorProfileImage) {
        this.no = no;
        this.id = id;
        this.title = title;
        this.content = content;
        this.ts = ts;
        this.images = images;
        this.authorName = authorName;
        this.replyCount = replyCount;
        this.likeCount = likeCount;
        this.authorProfileImage = authorProfileImage;
    }

    public int getNo() { return this.no; }
    public int getReplyCount() { return this.replyCount; }
    public int getLikeCount() { return this.likeCount; }
    public String getId() { return this.id; }
    public String getTitle() { return this.title; }
    public String getContent() { return this.content; }
    public String getTs() { return this.ts; }
    public String getImages() { return this.images; }
    public String getAuthorName() { return this.authorName; }
    public String getAuthorProfileImage() { return this.authorProfileImage; }
}
