package person.chb.dao;

import org.apache.ibatis.annotations.Param;
import person.chb.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User login(@Param("username") String username, @Param("password") String password);

    int checkByUsername(@Param("username") String username);

    int checkEmail(@Param("email") String email);


}