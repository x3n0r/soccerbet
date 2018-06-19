package at.allianz.coma.soccerbet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import at.allianz.coma.soccerbet.datamodel.Tournament;

public class TournamentDAO implements AutoCloseable {

	private static final String MODEL_CLASS_NAME = "at.allianz.coma.soccerbet.datamodel.Tournament";
	
	private final EntityManagerFactory factory = Persistence.createEntityManagerFactory("soccerbet");
	
	public List<Tournament> getAllTournaments() {
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		try {
			String query = String.format("SELECT t from %s t", MODEL_CLASS_NAME);
			return manager.createQuery(query, Tournament.class).getResultList();
		} finally {
			manager.getTransaction().commit();
			manager.close();
		}
	}
	public Tournament getTournament(String id) {
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		try {
			String query = String.format("SELECT t from %s t WHERE t.id='%s'", MODEL_CLASS_NAME, id);
			return manager.createQuery(query, Tournament.class).getSingleResult();
		} finally {
			manager.getTransaction().commit();
			manager.close();
		}
	}
	@Override
	public void close() throws Exception {
		factory.close();
	}
	
}
