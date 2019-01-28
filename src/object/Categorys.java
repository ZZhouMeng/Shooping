package object;

public class Categorys {
	private int categoryid;
	private String categoryname;
	
	public Categorys(){
		this.categoryid=0;
		this.categoryname="";
	}
	public Categorys(int categoryid,String categoryname){
		this.categoryid=categoryid;
		this.categoryname=categoryname;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	
}