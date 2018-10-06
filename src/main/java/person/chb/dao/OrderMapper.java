package person.chb.dao;

import org.apache.ibatis.annotations.Param;
import person.chb.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    Order selectByUserIdAndOrderNo(@Param("userId")Integer userId,@Param("orderNo")long orderNo);

    Order selectByOrderNo(@Param("orderNo")long orderNo);

}