package com.github.x3n0r.sportbet.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ttournament")
public class Tournament {

	@Id
	@Column(name = "tournament_id", nullable = false)
	private String id;
	@Column(name = "name", nullable = false)
	private String name;
	
	public Tournament() { }
	public Tournament(String id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
}
