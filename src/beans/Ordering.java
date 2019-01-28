package beans;

import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

public class Ordering {
    private  String orderingId=null;
    private int userId=-1;
    private int deliverId=-1;/******地址id***********/
    private List<Product> products = new LinkedList<Product>();

    public Ordering(int userId){
        setUserId(userId);
        String uuid = UUID.randomUUID().toString();
        setOrderingId(uuid);
    }
    public void add(int id,String name,float price,int quantity,float totalPrice,String img){
        Product product = new Product(id,name,price,quantity,totalPrice,img);
        products.add(product);
    }
    public String getOrderingId() {
        return orderingId;
    }

    public void setOrderingId(String orderingId) {
        this.orderingId = orderingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getDeliverId() {
        return deliverId;
    }

    public void setDeliverId(int deliverId) {
        this.deliverId = deliverId;
    }
    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

}

