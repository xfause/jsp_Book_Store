package entity;

import java.io.Serializable;

public class Book implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String bookName;
	private String bookAuthor;
	private double bookPrice;
	private String bookImageAddress;
	private int bookCount;
	private String bookIntroduce;
	private String bookType;
	
	public Book() {
		
	}
	
	public Book(int id, String bookName, String bookAuthor, double bookPrice, String bookImageAddress, int bookCount, String bookIntroduce, String bookType) {
		this.id = id;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPrice = bookPrice;
		this.bookImageAddress = bookImageAddress;
		this.bookCount = bookCount;
		this.bookIntroduce = bookIntroduce;
		this.bookType = bookType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public double getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(double bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getBookImageAddress() {
		return bookImageAddress;
	}

	public void setBookImageAddress(String bookImageAddress) {
		this.bookImageAddress = bookImageAddress;
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	public String getBookIntroduce() {
		return bookIntroduce;
	}

	public void setBookIntroduce(String bookIntroduce) {
		this.bookIntroduce = bookIntroduce;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", bookName=" + bookName + ", bookAuthor="
				+ bookAuthor + ", bookPrice=" + bookPrice
				+ ", bookImageAddress=" + bookImageAddress + ", bookCount="
				+ bookCount + ", bookIntroduce=" + bookIntroduce
				+ ", bookType=" + bookType + "]";
	}
}
