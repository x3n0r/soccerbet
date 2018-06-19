package com.github.x3n0r.soccerbet.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tspecial_bet_type")
public class SpecialBetType {

	@Id
	@Column(name = "special_bet_type_id", nullable = false)
	private String id;
	@ManyToOne
	@JoinColumn(name = "tournament_id", nullable = false)
	private Tournament tournament;
	@Column(name = "name", nullable = false)
	private String name;
	@Column(name = "cost", nullable = false)
	private float cost;
	
	public SpecialBetType() { }
	public SpecialBetType(String id, Tournament tournament, String name, float cost) {
		this.id = id;
		this.tournament = tournament;
		this.name = name;
		this.cost = cost;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Tournament getTournament() {
		return tournament;
	}
	public void setTournament(Tournament tournament) {
		this.tournament = tournament;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	
}
