package entity;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String account;
	private String password;
	private String birthday;
	private String sex;
	private String telephoneNumber;
	private String address;
	private String email;
	private double money;
	


	public User() {
		
	}
	

	public User(String account, String password){
		this.account = account;
		this.password = password;
	}
	
	public User(int id,String account,String name,String birthday,String sex,String telephoneNumber,String address,String email,double money) {
		this.id = id;
		this.account = account;
		this.name = name;
		this.birthday = birthday;
		this.sex = sex;
		this.telephoneNumber = telephoneNumber;
		this.address = address;
		this.email = email;
		this.money = money;
	}
	
	public User(String account,String password,String name,String birthday,String sex,String telephoneNumber,String address,String email,int money) {
		this.account = account;
		this.password = password;
		this.name  = name;
		this.birthday = birthday;
		this.sex = sex;
		this.telephoneNumber = telephoneNumber;
		this.address = address;
		this.email = email;
		this.money = money;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTelephoneNumber() {
		return telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", account=" + account
				+ ", password=" + password + ", birthday=" + birthday
				+ ", sex=" + sex + ", telephoneNumber=" + telephoneNumber
				+ ", address=" + address + ", email=" + email + ", money="
				+ money + "]";
	}
}
