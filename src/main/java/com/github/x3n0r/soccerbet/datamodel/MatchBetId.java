package com.github.x3n0r.soccerbet.datamodel;

import java.io.Serializable;
import java.util.Objects;

public class MatchBetId implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String user;
	private String match;
	
	public MatchBetId() { }
	public MatchBetId(String user, String match) {
		this.user = user;
		this.match = match;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getMatch() {
		return match;
	}
	public void setMatch(String match) {
		this.match = match;
	}
	@Override
	public int hashCode() {
		return Objects.hash(user, match);
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof MatchBetId) {
			MatchBetId id = (MatchBetId) obj;
			return id.getUser().equals(user) &&
					id.getUser().equals(match);
		}
		return false;
	}
	
}
