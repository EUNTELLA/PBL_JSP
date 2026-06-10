package dao;

public class UserObj {
    private String id, name, bio, ts;

    public UserObj(String id, String name, String bio, String ts) {
        this.id = id;
        this.name = name;
        this.bio = bio;
        this.ts = ts;
    }

    public String getId() { return this.id; }
    public String getName() { return this.name; }
    public String getBio() { return this.bio; }
    public String getTs() { return this.ts; }
}
