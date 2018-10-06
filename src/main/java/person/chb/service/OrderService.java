package person.chb.service;

import person.chb.common.Message;

import java.util.Map;

public interface OrderService {

    Message addOrder(int userId,int shippingId);

    Message pay(Long orderNo,Integer userId,String path);

    Message aliCallback(Map<String,String> params);

}
