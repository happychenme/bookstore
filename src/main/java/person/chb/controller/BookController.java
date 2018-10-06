package person.chb.controller;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.common.MsgCode;
import person.chb.pojo.*;
import person.chb.service.*;
import person.chb.utils.UpFileUtils;
import person.chb.vo.BookVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/jsp/")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CartService cartService;

    @Autowired
    private ReviewService reviewService;
    @Autowired
    private FileService fileService;

    @RequestMapping(value = "bookList.do",method = RequestMethod.GET)
    public ModelAndView categoryList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1")int pageNum, @RequestParam(value = "pageSize",defaultValue = "9")int pageSize)
    {
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user.getRole().equals(Const.Role.ROLE_ADMIN))
        {
            PageInfo<Book> pageInfo=bookService.findBookList(pageNum,pageSize);
            mv.addObject("page",pageInfo);
            mv.setViewName("book.jsp");
            return mv;
        }
        else
        {
            return null;
        }
    }

    @RequestMapping("searchBook.do")
    public ModelAndView searchBook(String name,@RequestParam(value = "pageNum",defaultValue = "1")int pageNum, @RequestParam(value = "pageSize",defaultValue = "9")int pageSize)
    {
        ModelAndView mv=new ModelAndView();
        PageInfo page=bookService.searchBook(name,pageNum,pageSize);
        mv.addObject("page",page);
        mv.setViewName("catelist.jsp");
        return mv;
    }

    @RequestMapping("toBuyBook.do")
    public ModelAndView toBuyBook(String id,HttpSession session)
    {
        ModelAndView mv=new ModelAndView();
        Book book=bookService.findBookById(id);
        String[] str=book.getSubImages().split(",");
        BookVo b=new BookVo();
        b.setId(book.getId());
        b.setDetail(book.getDetail());
        b.setImg2(str[1]);
        b.setImg3(str[2]);
        b.setImg4(str[3]);
        b.setMainImage(book.getMainImage());
        b.setName(book.getName());
        b.setPrice(book.getPrice());
        b.setStock(book.getStock());
        b.setSubtitle(book.getSubtitle());

        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user!=null)
        {
            Integer uId=user.getId();
            PageInfo pageInfo=reviewService.getReviewList(1,9,id,uId);
            mv.addObject("page",pageInfo);
            mv.addObject("book",b);
            mv.setViewName("buybook.jsp");
            return mv;
        }
        mv.setViewName("login.jsp");
        return mv;
    }

    @RequestMapping("add.do")
    @ResponseBody
    public Message add(String id,String quantity,HttpSession session)
    {
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user!=null)
        {
            Message msg=cartService.add(id,quantity,user.getId());
            if (msg.isSuccess())
            {
                return msg;
            }
            return Message.createByErrorMessage("增加失败");
        }
        else
        {
            return Message.createByErrorMessage("未登录");
        }
    }

    @RequestMapping("toUpdateBook.do")
    public ModelAndView toUpdateBook(String id) {
        ModelAndView mv=new ModelAndView();
        Book book=bookService.findBookById(id);
        List<Category> list=categoryService.findAllCategory();
        mv.addObject("book",book);
        mv.addObject("list",list);
        mv.setViewName("updatebook.jsp");
        return mv;
    }

    @RequestMapping(value = "upImgs.do",method = RequestMethod.POST)
    @ResponseBody
    public Message upImgs( HttpServletRequest request,@RequestParam("subImages") MultipartFile[] subImages) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user.getRole().equals(Const.Role.ROLE_ADMIN)) {
            StringBuilder sb = new StringBuilder();
            if (subImages != null && subImages.length > 0) {
                for (MultipartFile file : subImages) {
                    String url = UpFileUtils.getUrl(file, request);
                    sb.append(url + ',');
                }
            }

            String str = sb.toString();
            Book book=new Book();
            book.setSubImages(str);
            bookService.addBook(book);
        }
        return null;
    }

    @RequestMapping(value = "UpdateBook.do",method = RequestMethod.POST)
    @ResponseBody
    public Message UpdateBook(Book book, HttpServletRequest request) {
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user.getRole().equals(Const.Role.ROLE_ADMIN))
        {
            Message msg=bookService.addBook(book);
            return msg;
        }
        else
        {
            return Message.createBySuccessMessage("不是admin，没有权限");
        }
    }

    @RequestMapping("deleteBook.do")
    @ResponseBody
    public Message deleteBook(String id)
    {
        Message msg=bookService.deleteBook(id);
        return msg;
    }

    @RequestMapping("upload.do")
    @ResponseBody
    public Message upload(HttpSession session,@RequestParam(value = "img",required = false) MultipartFile img,HttpServletRequest request)
    {
        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user.getRole().equals(Const.Role.ROLE_ADMIN))
        {
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = fileService.upload(img,path);
            String url ="http://localhost:8099/"+targetFileName;

            Map fileMap = Maps.newHashMap();
            fileMap.put("uri",targetFileName);
            fileMap.put("url",url);
            return Message.createBySuccess(fileMap);
        }
        else
        {
            return Message.createBySuccessMessage("未登录");
        }
    }


}
