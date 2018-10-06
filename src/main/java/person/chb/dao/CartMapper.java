package person.chb.dao;

import org.apache.ibatis.annotations.Param;
import person.chb.pojo.Cart;

import java.util.List;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    List<Cart> selectByUser(@Param("userId") Integer userId);

    Cart selectByUserAndBookId(@Param("bookId") Integer bookId,@Param("userId") Integer userId);
}