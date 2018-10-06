package person.chb.service;

import com.github.pagehelper.PageInfo;
import person.chb.common.Message;

import javax.servlet.http.HttpSession;

public interface ReviewService {
    Message review(String content, String bId, HttpSession session);

    PageInfo getReviewList(Integer pageNum,Integer pageSize,String id, Integer uId);
}
