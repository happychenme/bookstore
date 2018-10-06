package person.chb.pojo;

import java.util.Date;

public class Review {
    private String id;

    private Integer userId;

    private Integer bookId;

    private String content;

    private Date times;

    public Review(String id, Integer userId, Integer bookId, String content, Date time) {
        this.id = id;
        this.userId = userId;
        this.bookId = bookId;
        this.content = content;
        this.times = times;
    }

    public Review() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getTimes() {
        return times;
    }

    public void setTimes(Date times) {
        this.times = times;
    }
}