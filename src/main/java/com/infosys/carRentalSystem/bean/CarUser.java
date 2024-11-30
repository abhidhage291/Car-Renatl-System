package com.infosys.carRentalSystem.bean;

import java.util.ArrayList;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

@Entity
public class CarUser extends User {
	
	@Id
	private String username;
	private String email;
	private String password;
	private String role;
	
	public CarUser() {
		super("abc","pqr",new ArrayList<>());
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public CarUser(String username, String password, java.util.Collection<? extends GrantedAuthority> authorities,
			String username2, String email, String password2, String role) {
		super(username, password, authorities);
		this.username = username2;
		this.email = email;
		this.password = password2;
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "CarUser [email=" + email + ", password=" + password + ", role=" + role + "]";
	}
	
}

