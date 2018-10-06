package person.chb.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.pojo.Review;
import person.chb.pojo.User;
import person.chb.service.ReviewService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/jsp/")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("review.do")
    @ResponseBody
    public Message review(String content,String bId,HttpSession session)
    {
        Message msg=reviewService.review(content,bId,session);
        return msg;
    }

    @RequestMapping("reviewList.do")
    public ModelAndView reviewList(HttpSession session, String bId, @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum, @RequestParam(value = "pageSize",defaultValue = "9") Integer pageSize)
    {
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        Integer uId=user.getId();
        if(user!=null)
        {
           PageInfo page=reviewService.getReviewList(pageNum,pageSize,bId,uId);
           mv.addObject("page",page);
           return mv;
        }
        else
        {
            mv.setViewName("login.jsp");
            return mv;
        }
    }

}
