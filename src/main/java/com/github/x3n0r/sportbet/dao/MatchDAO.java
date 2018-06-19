package com.github.x3n0r.sportbet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.github.x3n0r.sportbet.datamodel.Match;

public class MatchDAO implements AutoCloseable {

private static final String MODEL_CLASS_NAME = Match.class.getCanonicalName();
	
	private final EntityManagerFactory factory = Persistence.createEntityManagerFactory("sportbet");
	
	public List<Match> getAllMatches(String tournamentId) {
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		try {
			String query = String.format("SELECT m from %s m WHERE m.tournament='%s'",
					MODEL_CLASS_NAME, tournamentId);
			return manager.createQuery(query, Match.class).getResultList();
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
