package person.chb.service;

import person.chb.common.Message;
import person.chb.pojo.User;

import javax.servlet.http.HttpSession;

public interface UserService {

     Message<User> check(String username, String password);

     Message register(User user,String repwd);

    User getUser(Integer id);

    Message updateUser(User user,Integer id);

    Message updatePass(String password, String newpwd, String renewpwd,Integer id);
}
