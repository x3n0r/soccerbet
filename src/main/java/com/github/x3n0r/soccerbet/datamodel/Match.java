package com.github.x3n0r.soccerbet.datamodel;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tmatch")
public class Match {

	@Id
	@Column(name = "match_id", nullable = false)
	private String id;
	@ManyToOne
	@JoinColumn(name = "tournament_id", nullable = false)
	private Tournament tournament;
	@ManyToOne
	@JoinColumn(name = "match_type_id", nullable = false)
	private MatchType type;
	@ManyToOne
	@JoinColumn(name = "host_id", nullable = false)
	private Team host;
	@ManyToOne
	@JoinColumn(name = "guest_id", nullable = false)
	private Team guest;
	@Column(name = "time", nullable = false)
	private Date time;
	@Column(name = "host_goals", nullable = true)
	private int hostGoals;
	@Column(name = "guest_goals", nullable = true)
	private int guestGoals;
	
	public Match() { }
	public Match(String id, Tournament tournament, MatchType type, Team host, Team guest, Date time, int hostGoals,
			int guestGoals) {
		this.id = id;
		this.tournament = tournament;
		this.type = type;
		this.host = host;
		this.guest = guest;
		this.time = time;
		this.hostGoals = hostGoals;
		this.guestGoals = guestGoals;
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
	public MatchType getType() {
		return type;
	}
	public void setType(MatchType type) {
		this.type = type;
	}
	public Team getHost() {
		return host;
	}
	public void setHost(Team host) {
		this.host = host;
	}
	public Team getGuest() {
		return guest;
	}
	public void setGuest(Team guest) {
		this.guest = guest;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
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
	
}
