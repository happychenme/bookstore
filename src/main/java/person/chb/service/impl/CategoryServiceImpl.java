package person.chb.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import person.chb.common.Message;
import person.chb.dao.CategoryMapper;
import person.chb.pojo.Category;
import person.chb.service.CategoryService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public PageInfo<Category> findList(int pageNum, int pageSize) {

        PageHelper.startPage(pageNum,pageSize);
        List<Category> list=categoryMapper.getList();
        PageInfo<Category> pageInfo=new PageInfo<>(list,5);

        return pageInfo;
    }

    @Override
    public List<Category> findAllCategory() {
        return categoryMapper.getList();
    }

    @Override
    public Message updateCategory(Category category) {

       Category category2=categoryMapper.selectByName(category.getName());
       if (category2==null)
       {
           Date date=new Date();
           category.setCreateTime(date);
           category.setUpdateTime(date);
           category.setStatus(true);
           categoryMapper.insert(category);
           return Message.createBySuccessMessage("添加分类成功");
       }
       else
       {
           category.setId(category2.getId());
           categoryMapper.updateByPrimaryKeySelective(category);
           return Message.createBySuccessMessage("修改分类成功");
       }
    }

    @Override
    public Message deleteCategory(String id) {
        int count=categoryMapper.deleteByPrimaryKey(Integer.valueOf(id));
        if (count>=0)
        {
            return Message.createBySuccessMessage("删除成功");
        }
        else
        {
            return Message.createByErrorMessage("删除失败");
        }
    }

    @Override
    public Message findCategoryByName(String name) {
        PageHelper.startPage(1,9);
        Category category=categoryMapper.selectByName(name);
        List<Category> list=new ArrayList<>();
        list.add(category);
        PageInfo pageInfo=new PageInfo(list,5);
        return Message.createBySuccess("查询成功",pageInfo);
    }
}
