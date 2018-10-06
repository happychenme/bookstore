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
import person.chb.service.ShippingService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/jsp/")
public class ShippingController {

     @Autowired
     private ShippingService shippingService;


     @RequestMapping("addshipping.do")
     @ResponseBody
     public Message addshipping(Shipping shipping, HttpSession session)
     {
         User user= (User) session.getAttribute(Const.CURRENT_USER);
         if (user!=null)
         {
             return shippingService.add(shipping,user.getId());
         }
         else
         {
             return Message.createByErrorMessage("未登录");
         }
     }

     @RequestMapping("shippinglist.do")
     public ModelAndView shippinglist(HttpSession session)
     {
         ModelAndView mv=new ModelAndView();
         User user= (User) session.getAttribute(Const.CURRENT_USER);
         if (user!=null)
         {
             List<Shipping> list=shippingService.list();
             mv.addObject("ship",list);
             mv.setViewName("");//TODO
         }
         else
         {
             mv.setViewName("login.jsp");
         }
             return mv;
     }

     @RequestMapping("deleteShip.do")
     @ResponseBody
     public Message deleteShip(String id,HttpSession session)
     {
         Integer sId=Integer.valueOf(id);
         User user= (User) session.getAttribute(Const.CURRENT_USER);
         if (user!=null)
         {
             return shippingService.deleteById(sId);
         }
         else
         {
             return Message.createByErrorMessage("未登录");
         }
     }

    @RequestMapping("updateShip.do")
    @ResponseBody
    public Message updateShip(Integer id,Shipping shipping,HttpSession session)
    {
        Integer sId=Integer.valueOf(id);
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user!=null)
        {
            return shippingService.updateShip(sId,shipping);
        }
        else
        {
            return Message.createByErrorMessage("未登录");
        }
    }


}
