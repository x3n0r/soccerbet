package com.github.x3n0r.sportbet.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tteam")
public class Team {

	@Id
	@Column(name = "team_id", nullable = false)
	private String id;
	@Column(name = "name", nullable = false)
	private String name;
	@Column(name = "code", nullable = false)
	private String code;
	@Column(name = "img_url", nullable = false)
	private String imageUrl;
	
	public Team() { }
	public Team(String id, String name, String code, String imageUrl) {
		this.id = id;
		this.name = name;
		this.code = code;
		this.imageUrl = imageUrl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
}
