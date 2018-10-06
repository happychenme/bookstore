package person.chb.dao;

import org.apache.ibatis.annotations.Param;
import person.chb.pojo.OrderItem;

import java.util.List;

public interface OrderItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderItem record);

    int insertSelective(OrderItem record);

    OrderItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderItem record);

    int updateByPrimaryKey(OrderItem record);

    void insertList(@Param("list") List<OrderItem> list);

    List<OrderItem> getByOrderNoUserId(@Param("orderNo")long orderNo,@Param("userId")Integer userId);

}