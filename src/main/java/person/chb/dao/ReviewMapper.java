package person.chb.dao;

import org.apache.ibatis.annotations.Param;
import person.chb.pojo.Review;

import java.util.List;

public interface ReviewMapper {
    int insert(Review record);

    int insertSelective(Review record);

    List<Review> getReviewList(@Param("bId") Integer bId);
}