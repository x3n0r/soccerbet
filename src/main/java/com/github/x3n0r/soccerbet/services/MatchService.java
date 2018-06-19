package com.github.x3n0r.soccerbet.services;

import java.net.HttpURLConnection;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.github.x3n0r.soccerbet.dao.MatchDAO;

@Path("/match")
public class MatchService extends Service {

	@GET 
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getMatches(@QueryParam("tournament_id") String tournamentId,
			@DefaultValue("") @QueryParam("team_id") String teamId) {
		try (MatchDAO dao = new MatchDAO()) {
			tournamentId = decodeUrlParameter(tournamentId);
			teamId = decodeUrlParameter(teamId);
			return buildOkResponse(teamId.isEmpty() ? dao.getMatchesForTournament(tournamentId) :
					dao.getMatchesForTournamentAndTeam(tournamentId, teamId));
		} catch (Exception e) {
			return buildErrorResponse(HttpURLConnection.HTTP_BAD_REQUEST, e.getMessage());
		}
	}
	
}
