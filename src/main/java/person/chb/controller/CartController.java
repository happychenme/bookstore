package person.chb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.pojo.Shipping;
import person.chb.pojo.User;
import person.chb.service.CartService;
import person.chb.service.ShippingService;
import person.chb.vo.CartVo;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/jsp/")
public class CartController {

    @Autowired
    private ShippingService shippingService;
    @Autowired
    private CartService cartService;



    @RequestMapping("cartlist.do")
    public ModelAndView list(HttpSession session)
    {
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user==null)
        {
            mv.setViewName("login.jsp");
            return mv;
        }
        else
        {
            int userId=user.getId();
            List<CartVo> list=cartService.list(userId);
            mv.addObject("list",list);
            mv.setViewName("cart.jsp");
            return mv;
        }
    }
    ///////////////////////////////////////////////////////////////
    //TODO
    @RequestMapping("getCartList.do")
    public ModelAndView getCartList(HttpSession session)
    {
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user==null)
        {
            mv.setViewName("login.jsp");
            return mv;
        }
        else
        {
            int userId=user.getId();
            List<CartVo> list=cartService.list(userId);
            List<Shipping> ship=shippingService.list();
            mv.addObject("ship",ship);
            mv.addObject("list",list);
            mv.setViewName("order.jsp");
            return mv;
        }
    }

    @RequestMapping("deleteCartItem.do")
    @ResponseBody
    public Message deleteCartItem(String id)
    {
       return cartService.deleteCartItem(Integer.valueOf(id));
    }


}
