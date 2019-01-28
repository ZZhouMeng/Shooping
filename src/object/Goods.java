package object;

public class Goods {
	private int goodsid;
	private int categoryid;
	private String goodsname;
	private float preprice;
	private float nowprice;
	private int pepertory;
	private int sale;
	private float praisegrade;
	private String describe;
	private int display;
	private String picture;
	private int praisenum;
	
	public Goods(){
		this.goodsid=0;
		this.categoryid=0;
		this.goodsname="";
		this.preprice=0;
		this.nowprice=0;
		this.pepertory=0;
		this.sale=0;
		this.praisegrade=0;
		this.describe="";
		this.display=1;
		this.picture="";
		this.praisenum=1;
	}
	public Goods(int categoryid,String goodsname,float preprice,float nowprice,int pepertory,int sale,int praisegrade,String describe,int display,String picture,int praisenum){
		this.categoryid=categoryid;
		this.goodsname=goodsname;
		this.preprice=preprice;
		this.nowprice=nowprice;
		this.pepertory=pepertory;
		this.sale=sale;
		this.praisegrade=praisegrade;
		this.describe=describe;
		this.display=display;
		this.picture=picture;
		this.praisenum=praisenum;
	}
	public String getPicture() {
		return picture;
	}
	public int getPraisenum() {
		return praisenum;
	}
	public void setPraisenum(int praisenum) {
		this.praisenum = praisenum;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public int getGoodsid() {
		return goodsid;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public float getPreprice() {
		return preprice;
	}
	public void setPreprice(float preprice) {
		this.preprice = preprice;
	}
	public float getNowprice() {
		return nowprice;
	}
	public void setNowprice(float nowprice) {
		this.nowprice = nowprice;
	}
	public int getPepertory() {
		return pepertory;
	}
	public void setPepertory(int pepertory) {
		this.pepertory = pepertory;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public float getPraisegrade() {
		return praisegrade;
	}
	public void setPraisegrade(float praisegrade) {
		this.praisegrade = praisegrade;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
}