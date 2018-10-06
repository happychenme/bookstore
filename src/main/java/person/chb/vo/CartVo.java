package person.chb.vo;

import java.math.BigDecimal;

public class CartVo {

    private int id;

    private String img;

    private String name;

    private int num;

    private BigDecimal price;

    private BigDecimal totalPrice;

    private String subtitle;

    private String check;

    public CartVo() {
    }


    public CartVo(int id, String img, String name, int num, BigDecimal price, BigDecimal totalPrice, String subtitle, String check) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.num = num;
        this.price = price;
        this.totalPrice = totalPrice;
        this.subtitle = subtitle;
        this.check = check;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }
}
