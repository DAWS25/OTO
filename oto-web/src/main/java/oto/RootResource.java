package oto;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/")
public class RootResource {

    @GET
    @Produces(MediaType.TEXT_HTML)
    public String get() {
        return "🤖❤️";
    }
}
