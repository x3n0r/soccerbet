package at.allianz.coma.soccerbet.datamodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tuser")
public class User {

	@Id
	@Column(name = "user_id", nullable = false)
	private String id;
	@Column(name = "name", nullable = false)
	private String name;
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Bet> bets;
	
	public User() { }
	public User(String id, String name, List<Bet> bets) {
		super();
		this.id = id;
		this.name = name;
		this.bets = bets;
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
	public List<Bet> getBets() {
		return bets;
	}
	public void setBets(List<Bet> bets) {
		this.bets = bets;
	}
	
}
