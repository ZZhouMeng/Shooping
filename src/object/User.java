package object;

public class User {
	private String username;
	private String password;
	private String email;
	private String phone;

	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getUsername() {
		return username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public User() {
		this.username="";
		this.password="";
		this.email="";
		this.phone="";
	}
	public User(String username,String password,String email,String phone){
		this.username=username;
		this.password=password;
		this.email=email;
		this.phone=phone;
	}
	
}
