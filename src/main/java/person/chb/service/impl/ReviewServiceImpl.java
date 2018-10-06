package person.chb.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.dao.BookMapper;
import person.chb.dao.ReviewMapper;
import person.chb.dao.UserMapper;
import person.chb.pojo.Book;
import person.chb.pojo.Review;
import person.chb.pojo.User;
import person.chb.service.ReviewService;
import person.chb.vo.ReviewVo;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private UserMapper userMapper;


    @Override
    public Message review(String content, String bId, HttpSession session) {

        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user!=null)
        {
            Integer uId=user.getId();
            Review r=new Review();
            String id= UUID.randomUUID().toString().substring(0,3);
            r.setId(id);
            r.setBookId(Integer.valueOf(bId));
            r.setUserId(uId);
            Date date=new Date();
            r.setTimes(date);
            r.setContent(content);
            reviewMapper.insert(r);
            return Message.createBySuccess("评论成功",r);
        }
        else
        {
            return Message.createByErrorMessage("未登录");
        }
    }

    @Override
    public PageInfo getReviewList(Integer pageNum,Integer pageSize,String id, Integer uId) {
        PageHelper.startPage(pageNum,pageSize);
        Integer bId=Integer.valueOf(id);
        List<Review> list=reviewMapper.getReviewList(bId);
        List<ReviewVo> rvList=new ArrayList<>();
        for (Review r: list)
        {
            ReviewVo rv=new ReviewVo();
            rv.setId(r.getId());
            rv.setContent(r.getContent());
            Date date=new Date();//TODO
            SimpleDateFormat sf=new SimpleDateFormat("YYYY-MM-dd");
            String d=sf.format(date);
            rv.setTime(d);
            User u=userMapper.selectByPrimaryKey(r.getUserId());
            rv.setImg(u.getImg());
            rv.setUsername(u.getUsername());
            rvList.add(rv);
        }
        PageInfo pageInfo=new PageInfo(rvList,5);
        return pageInfo;
    }
}
