package person.chb.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.pojo.Book;
import person.chb.pojo.Category;
import person.chb.pojo.User;
import person.chb.service.BookService;
import person.chb.service.CategoryService;
import person.chb.service.UserService;
import person.chb.utils.UpFileUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/jsp/")
public class UserController {


    @Autowired
    private UserService userService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "check.do",method = RequestMethod.POST)
    @ResponseBody
    public Message check(String username, String password, HttpSession session)
    {
        Message msg=userService.check(username,password);
        if (msg.isSuccess())
        {
            User user= (User) msg.getData();
            if (user.getRole()==Const.Role.ROLE_ADMIN)
            {
                session.setAttribute(Const.CURRENT_USER,user);
                return Message.createBySuccessMessage("管理员登录成功");
            }
            if (user.getRole()==Const.Role.ROLE_CUSTOMER)
            {
                session.setAttribute(Const.CURRENT_USER,user);
                return Message.createBySuccessMessage("用户登录成功");
            }
        }
        return Message.createByErrorMessage("登录失败");
    }

    @RequestMapping(value = "uploadFile.do",method = RequestMethod.POST)
    @ResponseBody
    public Message uploadFile(@Param("img") MultipartFile img, HttpServletRequest request) throws IOException
    {
        String url=UpFileUtils.getUrl(img, request);
        return Message.createBySuccessMessage(url);
    }


    @RequestMapping("loginOut.do")
    public void loginOut(HttpSession session)
    {
        session.removeAttribute(Const.CURRENT_USER);
    }


    @RequestMapping("register.do")
    @ResponseBody
    public Message<String> register(User user,String repwd)
    {
        Message msg=userService.register(user,repwd);
        return msg;
    }

    @RequestMapping("list.do")
    public ModelAndView list()
    {
        ModelAndView mv=new ModelAndView();
        List<Category> list=categoryService.findAllCategory();
        List<Book> books=bookService.findAllBook();
        mv.addObject("list",list);
        mv.addObject("books",books);
        mv.setViewName("index.jsp");
        return mv;
    }

    @RequestMapping("getUser.do")
    public ModelAndView getUser(HttpSession session)
    {
        ModelAndView mv=new ModelAndView();
        User use= (User) session.getAttribute(Const.CURRENT_USER);
        User user=userService.getUser(use.getId());
        if (user!=null)
        {
            mv.addObject("user",user);
            mv.setViewName("info.jsp");
            return mv;
        }
        else
        {
            mv.setViewName("login.jsp");
            return mv;
        }
    }

    @RequestMapping("updateUser.do")
    @ResponseBody
    public Message updateUser(User user,HttpSession session)
    {
        User use= (User) session.getAttribute(Const.CURRENT_USER);
        if (use!=null)
        {
            return userService.updateUser(user,use.getId());
        }
        else
        {
            return Message.createByErrorMessage("未登录");
        }
    }

    @RequestMapping("updatePass.do")
    @ResponseBody
    public Message updatePass(String password,String newpwd,String renewpwd,HttpSession session)
    {
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user!=null)
        {
            if (newpwd.equals(renewpwd))
            {
                Message msg=userService.check(user.getUsername(),password);
                if (msg.isSuccess())
                {
                    return userService.updatePass(password,newpwd,renewpwd,user.getId());
                }
                return msg;
            }
            else
            {
                return Message.createByErrorMessage("两次输入密码不一致");
            }
        }
        else
        {
            return Message.createBySuccessMessage("未登录");
        }
    }


}
