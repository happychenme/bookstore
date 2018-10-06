package person.chb.service.impl;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import person.chb.common.Message;
import person.chb.dao.BookMapper;
import person.chb.dao.CartMapper;
import person.chb.pojo.Book;
import person.chb.pojo.Cart;
import person.chb.service.CartService;
import person.chb.vo.CartVo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private BookMapper bookMapper;


    @Override
    public Message<CartVo> add(String id, String quantity, Integer id1) {
        if (id!=null && quantity!=null && id1!=null)
        {
            Cart cart=cartMapper.selectByUserAndBookId(Integer.valueOf(id),id1);
            if (cart==null)
            {
                Cart c=new Cart();
                c.setUserId(Integer.valueOf(id1));
                c.setQuantity(Integer.valueOf(quantity));
                c.setBookId(Integer.valueOf(id));
                c.setChecked(1);
                cartMapper.insert(c);
                return Message.createBySuccessMessage("成功");
            }
            else
            {
                int num=cart.getQuantity()+Integer.valueOf(quantity);
                cart.setQuantity(num);
                cartMapper.updateByPrimaryKeySelective(cart);
                return Message.createBySuccessMessage("成功");
            }
        }
        return Message.createByErrorMessage("为空");
    }


    @Override
    public List<CartVo> list(int userId) {
        List<Cart> carts=cartMapper.selectByUser(userId);
        List<CartVo> list=new ArrayList<>();
        if (CollectionUtils.isNotEmpty(carts))
        {
            for(Cart c: carts)
            {
                CartVo cv=new CartVo();
                cv.setId(c.getId());
                cv.setNum(c.getQuantity());
                Book b=bookMapper.selectByPrimaryKey(c.getBookId());
                cv.setImg(b.getMainImage());
                cv.setName(b.getName());
                cv.setPrice(b.getPrice());
                /////////////////////////先这样吧
                BigDecimal number = new BigDecimal(0);
                int value=c.getQuantity();
                number=BigDecimal.valueOf((int)value);
                cv.setTotalPrice(number.multiply(b.getPrice()));
                /////////////////////////////////////////
                cv.setSubtitle(b.getSubtitle());
//                cv.setCheck(c.getChecked());
                list.add(cv);
            }
            return list;
        }
        return null;
    }

    @Override
    public Message deleteCartItem(Integer id) {
        int count=cartMapper.deleteByPrimaryKey(id);
        if (count>0)
        {
            return Message.createBySuccessMessage("删除成功");
        }
        return Message.createByErrorMessage("删除失败");
    }
}
