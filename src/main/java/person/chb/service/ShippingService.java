package person.chb.service;

import person.chb.common.Message;
import person.chb.pojo.Shipping;

import java.util.List;

public interface ShippingService {

    Message add(Shipping shipping, Integer id);

    List<Shipping> list();

    Message deleteById(Integer id);

    Message updateShip(Integer id, Shipping shipping);
}
