package beans;

public class Product {

    public int  id;
    public String name;
    public float price;
    public int  quantity;
    public float totalPrice;
    public String img;
    
    public Product(int id, String name, float price, int quantity, float totalPrice, String img) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.img = img;
    }
}
