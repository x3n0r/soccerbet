package at.allianz.coma.soccerbet.services;

import java.net.HttpURLConnection;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import at.allianz.coma.soccerbet.dao.TournamentDAO;

@Path("/tournament")
public class TournamentService extends Service {

	@Path("all")
	@GET 
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getAllTournaments() {
		try (TournamentDAO dao = new TournamentDAO()) {
			return buildOkResponse(dao.getAllTournaments());
		} catch (Exception e) {
			return buildErrorResponse(HttpURLConnection.HTTP_BAD_REQUEST, e.getMessage());
		}
	}
	@Path("single")
	@GET 
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getTournament(@QueryParam("id") String id) {
		try (TournamentDAO dao = new TournamentDAO()) {
			id = decodeUrlParameter(id);
			return buildOkResponse(dao.getTournament(id));
		} catch (Exception e) {
			return buildErrorResponse(HttpURLConnection.HTTP_BAD_REQUEST, e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		(new TournamentService()).getAllTournaments();
	}
	
}
