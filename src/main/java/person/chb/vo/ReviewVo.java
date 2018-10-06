package person.chb.vo;


public class ReviewVo {

    //Review的id
    private String id;
    private String content;
    private String time;
    private String img;
    private String username;

    public ReviewVo() {
    }

    public ReviewVo(String id, String content, String time, String img, String username) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.img = img;
        this.username = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
