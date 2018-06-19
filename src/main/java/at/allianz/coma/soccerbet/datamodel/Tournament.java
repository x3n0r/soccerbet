package at.allianz.coma.soccerbet.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ttournament")
public class Tournament {

	@Id
	@Column(name = "tournament_id", nullable = false)
	private String id;
	@Column(name = "name", nullable = false)
	private String name;
	@OneToMany(mappedBy = "tournament", fetch = FetchType.LAZY)
	private List<Match> matches;
	
	public Tournament() { }
	public Tournament(String id, String name, List<Match> matches) {
		super();
		this.id = id;
		this.name = name;
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
	public List<Match> getMatches() {
		return matches;
	}
	public void setMatches(List<Match> matches) {
		this.matches = matches;
	}
	
}
