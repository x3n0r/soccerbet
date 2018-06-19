package com.github.x3n0r.sportbet.services;

import java.net.HttpURLConnection;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.github.x3n0r.sportbet.dao.MatchDAO;

@Path("/match")
public class MatchService extends Service {

	@Path("all")
	@GET 
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getTournament(@QueryParam("id") String tournament_id) {
		try (MatchDAO dao = new MatchDAO()) {
			tournament_id = decodeUrlParameter(tournament_id);
			return buildOkResponse(dao.getAllMatches(tournament_id));
		} catch (Exception e) {
			return buildErrorResponse(HttpURLConnection.HTTP_BAD_REQUEST, e.getMessage());
		}
	}
	
}
