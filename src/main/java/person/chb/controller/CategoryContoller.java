package person.chb.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.pojo.Category;
import person.chb.pojo.User;
import person.chb.service.CategoryService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/jsp/")
public class CategoryContoller {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "categoryList.do",method = RequestMethod.GET)
    public ModelAndView categoryList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1")int pageNum, @RequestParam(value = "pageSize",defaultValue = "9")int pageSize)
    {
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user.getRole().equals(Const.Role.ROLE_ADMIN))
        {
            PageInfo<Category> pageInfo=categoryService.findList(pageNum,pageSize);
            mv.addObject("page",pageInfo);
            mv.setViewName("categotry.jsp");
            return mv;
        }
        else
        {
            return null;
        }
    }

    @RequestMapping("toupdatecategory.do")
    public ModelAndView toupdatecategory(String name) {
        ModelAndView mv=new ModelAndView();
        List<Category> list=categoryService.findAllCategory();
        mv.addObject("list",list);
        mv.addObject("name",name);
        mv.setViewName("updateCategory.jsp");
        return mv;
    }

    @RequestMapping("updateCategory.do")
    @ResponseBody
    public Message updateCategory(Category category)
    {
        Message msg=categoryService.updateCategory(category);
        return msg;
    }

    @RequestMapping("deleteCategory.do")
    @ResponseBody
    public Message deleteCategory(String id)
    {
        Message msg=categoryService.deleteCategory(id);
        return msg;
    }

    @RequestMapping("findCategoryByName.do")
    @ResponseBody
    public ModelAndView findCategoryByName(String name)
    {
        ModelAndView mv=new ModelAndView();
        Message msg=categoryService.findCategoryByName(name);
        mv.addObject("page",msg.getData());
        mv.setViewName("categotry.jsp");
        return mv;
    }


}
