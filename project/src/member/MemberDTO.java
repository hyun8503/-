package member;

import java.sql.Date;

public class MemberDTO {
	private String email;
	private String passwd;
	private String name;
	private String course;
	private Date join_date;
	//getter,setter, toString, 생성자(2개)

	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "MemberDTO [passwd=" + passwd + ", name=" + name + ", course=" + course + ", email=" + email + ", join_date="
				+ join_date + "]";
	}
	public MemberDTO() {

	}
	public MemberDTO(String email, String passwd, String name, String course, Date join_date) {
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.course = course;
		this.join_date = join_date;
	}
}
