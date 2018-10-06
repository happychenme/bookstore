package person.chb.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.dao.BookMapper;
import person.chb.dao.CartMapper;
import person.chb.pojo.Book;
import person.chb.pojo.Cart;
import person.chb.pojo.User;
import person.chb.service.BookService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private CartMapper cartMapper;

    @Override
    public PageInfo<Book> findBookList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Book> list=bookMapper.selectBookList();
        PageInfo pageInfo=new PageInfo(list,5);
        return pageInfo;
    }

    @Override
    public Message deleteBook(String id) {
        int count=bookMapper.deleteByPrimaryKey(Integer.parseInt(id));
        if (count>0)
        {
            return Message.createBySuccessMessage("删除成功");
        }
        else
        {
            return Message.createByErrorMessage("删除失败");
        }
    }

    @Override
    public Book findBookById(String id) {
        return bookMapper.selectByPrimaryKey(Integer.valueOf(id));
    }

    @Override
    public Message addBook(Book book) {
        if (book!=null)
        {
            if (book.getId()==null)
            {
                String str=book.getSubImages();
                String[] st=str.split(",");
                book.setMainImage(st[0]);
                Date date=new Date();
                book.setCreateTime(date);
                book.setUpdateTime(date);
                book.setStatus(1);
                bookMapper.insert(book);
                return Message.createBySuccess("添加成功",book);
            }
            else
            {
                bookMapper.updateByPrimaryKeySelective(book);
                return Message.createBySuccess("修改成功",book);
            }

        }
        return Message.createByErrorMessage("传入book参数有问题");
    }

    @Override
    public List<Book> findAllBook() {
        return bookMapper.selectBookList();
    }

    @Override
    public PageInfo searchBook(String name,int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Book> list=bookMapper.searchBook(name);
        PageInfo pageInfo=new PageInfo(list,5);
        return pageInfo;
    }

    @Override
    public Message buybook(String id, String quantity, HttpSession session) {

        User user= (User) session.getAttribute(Const.CURRENT_USER);
        if (user!=null)
        {
            Cart cart=new Cart();
            cart.setBookId(Integer.valueOf(id));
            cart.setQuantity(Integer.valueOf(quantity));
            cart.setUserId(user.getId());
            Date date=new Date();
            cart.setCreateTime(date);
            cart.setUpdateTime(date);
            cartMapper.insert(cart);
            return Message.createBySuccess("加入购物车成功",cart);
        }
        else
        {
            return Message.createByErrorMessage("用户未登录");
        }
    }
}
