package ch.zli.m223.entries;

public class Entry {
	protected int id;
	protected String title;
	protected String text;

	public Entry() {
	}

	public Entry(int id) {
		this.id = id;
	}

	public Entry(int id, String title, String text) {
		this(title, text);
		this.id = id;
	}
	
	public Entry(String title, String text) {
		this.title = title;
		this.text = text;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
