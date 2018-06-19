package com.github.x3n0r.soccerbet.datamodel;

import java.io.Serializable;
import java.util.Objects;

public class MatchBetCostId implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String tournament;
	private String matchType;
	
	public MatchBetCostId() { }
	
	public MatchBetCostId(String tournament, String matchType) {
		super();
		this.tournament = tournament;
		this.matchType = matchType;
	}
	public String getTournament() {
		return tournament;
	}
	public void setTournament(String tournament) {
		this.tournament = tournament;
	}
	public String getMatchType() {
		return matchType;
	}
	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}
	@Override
	public int hashCode() {
		return Objects.hash(tournament, matchType);
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof MatchBetCostId) {
			MatchBetCostId id = (MatchBetCostId) obj;
			return id.getTournament().equals(tournament) &&
					id.getMatchType().equals(matchType);
		}
		return false;
	}
	
}
