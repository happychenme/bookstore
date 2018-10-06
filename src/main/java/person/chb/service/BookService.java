package person.chb.service;

import com.github.pagehelper.PageInfo;
import person.chb.common.Message;
import person.chb.pojo.Book;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface BookService {


    PageInfo<Book> findBookList(int pageNum, int pageSize);

    Message deleteBook(String id);

    Book findBookById(String id);

    Message addBook(Book book);

    List<Book> findAllBook();

    PageInfo searchBook(String name,int pageNum, int pageSize);

    Message buybook(String id, String quantity, HttpSession session);
}
