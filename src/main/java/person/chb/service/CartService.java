package person.chb.service;

import person.chb.common.Message;
import person.chb.vo.CartVo;

import java.util.List;


public interface CartService {

    Message add(String id, String quantity, Integer id1);

    List<CartVo> list(int userId);

    Message deleteCartItem(Integer id);
}
