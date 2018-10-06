package person.chb.common;

import org.codehaus.jackson.annotate.JsonIgnore;

import java.io.Serializable;

public class Message<T> implements Serializable {

    private int status;
    private String msg;
    private T data;

    private Message(int status) {
        this.status = status;
    }

    private Message(int status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    private Message(int status, String msg, T data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    private Message(int status, T data) {
        this.status = status;
        this.data = data;
    }

    @JsonIgnore
    public boolean isSuccess()
    {
       return this.status==MsgCode.SUCCESS.getCode();
    }

    public int getStatus() {
        return status;
    }

    public String getMsg() {
        return msg;
    }

    public T getData() {
        return data;
    }

    public static <T> Message<T> createBySuccess()
    {
        return new Message<T>(MsgCode.SUCCESS.getCode());
    }

    public static <T> Message<T> createBySuccessMessage(String msg)
    {
        return new Message<T>(MsgCode.SUCCESS.getCode(),msg);
    }

    public static <T> Message<T> createBySuccess(T data)
    {
        return new Message<T>(MsgCode.SUCCESS.getCode(),data);
    }

    public static <T> Message<T> createBySuccess(String msg,T data)
    {
        return new Message<T>(MsgCode.SUCCESS.getCode(),msg,data);
    }

    public static <T> Message<T> createByError()
    {
        return new Message<T>(MsgCode.ERROR.getCode(),MsgCode.ERROR.getDesc());
    }

    public static <T> Message<T> createByErrorMessage(String errorMsg)
    {
        return new Message<T>(MsgCode.ERROR.getCode(),errorMsg);
    }

    public static <T> Message<T> createByErrorCodeMessage(int errorCode,String errorMsg)
    {
        return new Message<T>(errorCode,errorMsg);
    }

}
