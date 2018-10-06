package person.chb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import person.chb.common.Message;
import person.chb.dao.ShippingMapper;
import person.chb.pojo.Shipping;
import person.chb.service.ShippingService;

import java.util.Date;
import java.util.List;

@Service
public class ShippingServiceImpl implements ShippingService {


    @Autowired
    private ShippingMapper shippingMapper;


    @Override
    public Message add(Shipping shipping, Integer id) {
        int count;
        Date date=new Date();
        shipping.setUserId(id);
        shipping.setCreateTime(date);
        shipping.setUpdateTime(date);
        count=shippingMapper.insert(shipping);
        if (count>0)
        {
            return Message.createBySuccessMessage("添加成功");
        }
        return Message.createByErrorMessage("添加异常");
    }

    @Override
    public List<Shipping> list() {
        return shippingMapper.selectByList();
    }

    @Override
    public Message deleteById(Integer id) {
        int count;
        count=shippingMapper.deleteByPrimaryKey(id);
        if (count>0)
        {
            return Message.createBySuccessMessage("删除成功");
        }
        return Message.createBySuccessMessage("删除失败");
    }

    @Override
    public Message updateShip(Integer id, Shipping shipping) {
        Shipping shipping1=shippingMapper.selectByPrimaryKey(id);
        if (shipping1!=null)
        {
            int count=shippingMapper.updateByPrimaryKeySelective(shipping);
            if (count>0)
            {
                return Message.createBySuccess("修改成功",shipping);
            }
            return Message.createByErrorMessage("修改失败");
        }
        return Message.createByErrorMessage("无法通过id找到收货地址信息");
    }


}
