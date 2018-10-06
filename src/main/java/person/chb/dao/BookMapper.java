package person.chb.dao;

import org.apache.ibatis.annotations.Param;
import person.chb.pojo.Book;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    List<Book> selectBookList();

    List<Book> searchBook(@Param("name") String name);
}