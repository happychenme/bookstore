package person.chb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import person.chb.pojo.Category;
import person.chb.service.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/jsp/")
public class PageController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("toadmin.do")
    public ModelAndView toadmin()
    {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("back.jsp");
        return mv;
    }

    @RequestMapping("tologin.do")
    public ModelAndView tologin()
    {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("login.jsp");
        return mv;
    }

    @RequestMapping("toupdatebook.do")
    public ModelAndView toupdatebook() {
        ModelAndView mv=new ModelAndView();
        List<Category> list=categoryService.findAllCategory();
        mv.addObject("list",list);
        mv.setViewName("updatebook.jsp");
        return mv;
    }

    @RequestMapping("toAddSuccess.do")
    public ModelAndView toAddSuccess()
    {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("addsuccess.jsp");
        return mv;
    }








}
