package entity;

public class Order {
	private int id;
	private String time;
	private int bookId;
	private int count;
	
	public Order() {
		
	}
	
	public Order(int id, String time, int bookId, int count) {
		this.id = id ;
		this.time = time;
		this.bookId = bookId;
		this.count = count;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", time=" + time + ", bookId=" + bookId
				+ ", count=" + count + "]";
	}
}
