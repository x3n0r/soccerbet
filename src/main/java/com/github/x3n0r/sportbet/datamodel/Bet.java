package com.github.x3n0r.sportbet.datamodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(BetId.class)
@Table(name="tbet")
public class Bet {

	@Id
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	@Id
	@ManyToOne
	@JoinColumn(name = "match_id", nullable = false)
	private Match match;
	@Column(name = "host_goals", nullable = false)
	private int hostGoals;
	@Column(name = "guest_goals", nullable = false)
	private int guestGoals;
	@Column(name = "payed", nullable = false)
	private boolean payed;
	
	public Bet() { }
	public Bet(User user, Match match, int hostGoals, int guestGoals, boolean payed) {
		this.user = user;
		this.match = match;
		this.hostGoals = hostGoals;
		this.guestGoals = guestGoals;
		this.payed = payed;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Match getMatch() {
		return match;
	}
	public void setMatch(Match match) {
		this.match = match;
	}
	public int getHostGoals() {
		return hostGoals;
	}
	public void setHostGoals(int hostGoals) {
		this.hostGoals = hostGoals;
	}
	public int getGuestGoals() {
		return guestGoals;
	}
	public void setGuestGoals(int guestGoals) {
		this.guestGoals = guestGoals;
	}
	public boolean isPayed() {
		return payed;
	}
	public void setPayed(boolean payed) {
		this.payed = payed;
	}
	
}
