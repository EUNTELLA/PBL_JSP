package dao;

public class FeedObj {
    private int no;
    private String id, title, content, ts, images;
	
    public FeedObj(int no, String id, String title, String content, String ts, String images) {
        this.no = no;
        this.id = id;
        this.title = title;
        this.content = content;
        this.ts = ts;
        this.images = images;
    }

    public int getNo() { return this.no; }
    public String getId() { return this.id; }
    public String getTitle() { return this.title; }
    public String getContent() { return this.content; }
    public String getTs() { return this.ts; }
    public String getImages() { return this.images; }
}
