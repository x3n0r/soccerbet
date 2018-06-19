package at.allianz.coma.soccerbet.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tmatch_type")
public class MatchType {

	@Id
	@Column(name = "match_type_id", nullable = false)
	private String id;
	@Column(name = "name", nullable = false)
	private String name;
	@Column(name = "bet_value", nullable = false)
	private float betValue;
	@OneToMany(mappedBy = "type", fetch = FetchType.LAZY)
	private List<Match> matches;
	
	public MatchType() { }
	public MatchType(String id, String name, int betValue, List<Match> matches) {
		this.id = id;
		this.name = name;
		this.betValue = betValue;
		this.matches = matches;
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
	public float getBetValue() {
		return betValue;
	}
	public void setBetValue(float betValue) {
		this.betValue = betValue;
	}
	public List<Match> getMatches() {
		return matches;
	}
	public void setMatches(List<Match> matches) {
		this.matches = matches;
	}
	
}
