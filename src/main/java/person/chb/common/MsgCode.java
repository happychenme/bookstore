package person.chb.common;

public enum MsgCode {

     SUCCESS(0,"SUCCESS"),
     ERROR(1,"ERROR"),
     NEED_LOGIN(2,"NEED_LOGIN");

    private final int code;
    private final String desc;

    MsgCode(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
