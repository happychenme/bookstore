package person.chb.service;

import com.github.pagehelper.PageInfo;
import person.chb.common.Message;
import person.chb.pojo.Category;

import java.util.List;

public interface CategoryService {
    PageInfo<Category> findList(int pageNum, int pageSize);

    List<Category> findAllCategory();

    Message updateCategory(Category category);

    Message deleteCategory(String id);

    Message findCategoryByName(String name);
}
