package com.github.x3n0r.soccerbet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.github.x3n0r.soccerbet.datamodel.Tournament;

public class TournamentDAO implements AutoCloseable {

	private static final String MODEL_CLASS_NAME = Tournament.class.getCanonicalName();
	
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
	@Override
	public void close() throws Exception {
		factory.close();
	}
	
}
