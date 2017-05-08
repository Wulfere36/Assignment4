package Assign4;

public class Item {
	private int id;
	private String name;
	private int qty;
	private int uid;
	
	public Item(int id, String name, int qty, int uid) {
		super();
		this.id = id;
		this.name = name;
		this.qty = qty;
		this.uid = uid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Item() {
		super();
	}
	public Item(int id, String name, int qty) {
		super();
		this.id = id;
		this.name = name;
		this.qty = qty;
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
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}
