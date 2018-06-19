package com.github.x3n0r.soccerbet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.github.x3n0r.soccerbet.datamodel.Match;

public class MatchDAO implements AutoCloseable {

private static final String MODEL_CLASS_NAME = Match.class.getCanonicalName();
	
	private final EntityManagerFactory factory = Persistence.createEntityManagerFactory("soccerbet");
	
	public List<Match> getMatchesForTournament(String tournamentId) {
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
	public List<Match> getMatchesForTournamentAndTeam(String tournamentId, String teamId) {
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		try {
			String query = String.format("SELECT m from %s m WHERE m.tournament='%s' AND (m.host='%s' OR m.guest='%s')",
					MODEL_CLASS_NAME, tournamentId, teamId, teamId);
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
