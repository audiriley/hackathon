package db;

import java.text.*;
import java.util.*;

public class MemberBean {

	private String id;
	private String pass;
	private String email;
	private String date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String setEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getRegisterDate() {
		return pass;
	}

	public void setRegisterDate(String string) {
		this.date=string;
	}

	public String getEmail() {
		// TODO Auto-generated method stub
		return null;
	}
}