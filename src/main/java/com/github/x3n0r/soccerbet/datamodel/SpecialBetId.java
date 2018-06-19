package com.github.x3n0r.soccerbet.datamodel;

import java.io.Serializable;
import java.util.Objects;

public class SpecialBetId implements Serializable {

private static final long serialVersionUID = 1L;
	
	private String user;
	private String team;
	
	public SpecialBetId() { }
	public SpecialBetId(String user, String team) {
		this.user = user;
		this.team = team;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	@Override
	public int hashCode() {
		return Objects.hash(user, team);
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof SpecialBetId) {
			SpecialBetId id = (SpecialBetId) obj;
			return id.getUser().equals(user) &&
					id.getTeam().equals(team);
		}
		return false;
	}
	
}
