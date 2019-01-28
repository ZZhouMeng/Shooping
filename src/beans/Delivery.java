package beans;

public class Delivery {
    public String province=null;
    public String  city=null;
    public String  area=null;
    public String detail=null;
    public String phone=null;
    public String  deliveryname=null;
    public int deliveryid;

    public Delivery(String province, String city, String area, String detail, String phone, String deliveryname, int deliveryid) {
        this.province = province;
        this.city = city;
        this.area = area;
        this.detail = detail;
        this.phone = phone;
        this.deliveryname = deliveryname;
        this.deliveryid = deliveryid;
    }
}
