package person.chb.vo;

import java.math.BigDecimal;
import java.util.Date;

public class BookVo {

    private Integer id;

    private String name;

    private String subtitle;

    private String mainImage;

    private String img2;

    private String img3;

    private String img4;

    private String detail;

    private BigDecimal price;

    private Integer stock;

    public BookVo() {
    }

    public BookVo(Integer id, String name, String subtitle, String mainImage, String img2, String img3, String img4, String detail, BigDecimal price, Integer stock) {
        this.id = id;
        this.name = name;
        this.subtitle = subtitle;
        this.mainImage = mainImage;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.detail = detail;
        this.price = price;
        this.stock = stock;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }
}
