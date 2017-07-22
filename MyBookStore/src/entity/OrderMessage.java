package entity;

public class OrderMessage {
	private int orderId;
	private String time;
	private int bookId;
	private String bookName;
	private String bookAuthor;
	private double bookPrice;
	private String imageAddress;
	private int count;
	
	public OrderMessage() {
		
	}
	
	public OrderMessage(int orderId,String time, int bookId, String bookName, String bookAuthor, double bookPrice, String imageAddress, int count) {
		this.orderId = orderId;
		this.time = time;
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPrice = bookPrice;
		this.imageAddress = imageAddress;
		this.count = count;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getBookName() {
		return bookName;
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

	public String getImageAddress() {
		return imageAddress;
	}

	public void setImageAddress(String imageAddress) {
		this.imageAddress = imageAddress;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "OrderMessage [orderId=" + orderId + ", time=" + time
				+ ", bookId=" + bookId + ", bookName=" + bookName
				+ ", bookAuthor=" + bookAuthor + ", bookPrice=" + bookPrice
				+ ", imageAddress=" + imageAddress + ", count=" + count + "]";
	}
}
