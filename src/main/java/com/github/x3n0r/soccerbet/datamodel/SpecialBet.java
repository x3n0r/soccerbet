package com.github.x3n0r.soccerbet.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(SpecialBetId.class)
@Table(name="tspecial_bet")
public class SpecialBet {

	@Id
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	@Id
	@ManyToOne
	@JoinColumn(name = "team_id", nullable = false)
	private Team team;
	@ManyToOne
	@JoinColumn(name = "special_bet_type_id", nullable = false)
	private SpecialBetType betType;
	@Column(name = "payed", nullable = false)
	private boolean payed;
	
	public SpecialBet() { }
	public SpecialBet(User user, Team team, SpecialBetType betType, boolean payed) {
		this.user = user;
		this.team = team;
		this.betType = betType;
		this.payed = payed;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	public SpecialBetType getBetType() {
		return betType;
	}
	public void setBetType(SpecialBetType betType) {
		this.betType = betType;
	}
	public boolean isPayed() {
		return payed;
	}
	public void setPayed(boolean payed) {
		this.payed = payed;
	}
	
}