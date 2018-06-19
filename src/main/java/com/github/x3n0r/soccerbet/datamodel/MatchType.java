package com.github.x3n0r.soccerbet.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tmatch_type")
public class MatchType {

	@Id
	@Column(name = "match_type_id", nullable = false)
	private String id;
	@Column(name = "name", nullable = false)
	private String name;
	
	public MatchType() { }
	public MatchType(String id, String name) {
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
