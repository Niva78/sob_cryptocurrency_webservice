package cat.urv.deim.sob.service;

import cat.urv.deim.sob.model.Purchase;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.Base64;

public class PurchaseService {
    private WebTarget webTarget;
    private jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/sob-cryptocurrency-explorer/rest/api/v1/purchase";
    
    public PurchaseService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }
    
    public Purchase makePurchase(int cryptocurrencyId, double purchasedAmount, String password, String email){
        String jsonBody = "{\"purchasedAmount\":" + purchasedAmount + "}";
        String credentials = email + ":" + password;
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes());
        Response response = webTarget
                .queryParam("cryptocurrency", cryptocurrencyId)
                .request(MediaType.APPLICATION_JSON)
                .header(HttpHeaders.AUTHORIZATION, "Basic " + encodedCredentials)
                .post(Entity.entity(jsonBody, MediaType.APPLICATION_JSON));
        if (response.getStatus() == 201)
            return response.readEntity(Purchase.class);
        return null;
    }
}
