package at.allianz.coma.soccerbet.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tteam")
public class Team {

	@Id
	@Column(name = "team_id", nullable = false)
	private String id;
	@Column(name = "name", nullable = false)
	private String name;
	@Column(name = "code", nullable = false)
	private String code;
	@Column(name = "img_url", nullable = false)
	private String imageUrl;
	@OneToMany(mappedBy = "host", fetch = FetchType.LAZY)
	private List<Match> matchesAsHost;
	@OneToMany(mappedBy = "guest", fetch = FetchType.LAZY)
	private List<Match> matchesAsGuest;
	
	public Team() { }
	public Team(String id, String name, String code, String imageUrl, List<Match> matchesAsHost,
			List<Match> matchesAsGuest) {
		this.id = id;
		this.name = name;
		this.code = code;
		this.imageUrl = imageUrl;
		this.matchesAsHost = matchesAsHost;
		this.matchesAsGuest = matchesAsGuest;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public List<Match> getMatchesAsHost() {
		return matchesAsHost;
	}
	public void setMatchesAsHost(List<Match> matchesAsHost) {
		this.matchesAsHost = matchesAsHost;
	}
	public List<Match> getMatchesAsGuest() {
		return matchesAsGuest;
	}
	public void setMatchesAsGuest(List<Match> matchesAsGuest) {
		this.matchesAsGuest = matchesAsGuest;
	}
	
}
