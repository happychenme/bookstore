package person.chb.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import person.chb.common.Const;
import person.chb.common.Message;
import person.chb.dao.UserMapper;
import person.chb.pojo.User;
import person.chb.service.UserService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Message<User> check(String username, String password) {
        int count=userMapper.checkByUsername(username);
        if (count==0)
        {
            return Message.createByErrorMessage("用户名不存在");
        }
        User user=userMapper.login(username,password);
        if (user==null)
        {
            return Message.createByErrorMessage("密码错误");
        }
        user.setPassword(StringUtils.EMPTY);
        user.setQuestion(StringUtils.EMPTY);
        user.setAnswer(StringUtils.EMPTY);
        return Message.createBySuccess("校验成功",user);
    }

    @Override
    public Message register(User user,String repwd) {
        int count=userMapper.checkByUsername(user.getUsername());
        if (count>0)
        {
            return Message.createByErrorMessage("用户名已经存在");
        }
        int count2=userMapper.checkEmail(user.getEmail());
        if (count2>0)
        {
            return Message.createByErrorMessage("邮箱已经存在");
        }
        if (!repwd.equals(user.getPassword()))
        {
            return Message.createByErrorMessage("两次输入密码不一致");
        }
        user.setRole(Const.Role.ROLE_CUSTOMER);
        Date date=new Date();
//        SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String d = sdformat.format(date);
        user.setCreateTime(date);
        user.setUpdateTime(date);
        int resultCount=userMapper.insert(user);
        if (resultCount==0)
        {
            return Message.createByErrorMessage("注册失败");
        }
        return Message.createBySuccessMessage("注册成功");
    }

    @Override
    public User getUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public Message updateUser(User user,Integer id) {
        try {
            User use=userMapper.selectByPrimaryKey(id);
            user.setId(use.getId());
            userMapper.updateByPrimaryKeySelective(user);
            return Message.createBySuccessMessage("修改成功");
        }catch (Exception e)
        {
            return Message.createByErrorMessage("修改出错");
        }
    }

    @Override
    public Message updatePass(String password, String newpwd, String renewpwd,Integer id) {
        User user=new User();
        user.setId(id);
        user.setPassword(newpwd);
        try {
            userMapper.updateByPrimaryKeySelective(user);
            return Message.createBySuccessMessage("修改成功");
        }catch (Exception e)
        {
            return Message.createByErrorMessage("修改失败");
        }
    }
}
