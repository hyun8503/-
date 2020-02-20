package memo;

public class memoDTO {
	private String name;
	private String memo;
	private String post_date;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "memoDTO [name=" + name + ", memo=" + memo + ", post_date=" + post_date + "]";
	}
	public memoDTO(String name, String memo, String post_date) {
		this.name = name;
		this.memo = memo;
		this.post_date = post_date;
	}
	public memoDTO() {
	}

}
