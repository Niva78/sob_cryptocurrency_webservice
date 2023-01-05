package cat.urv.deim.sob.service;

import cat.urv.deim.sob.model.Purchase;
import cat.urv.deim.sob.model.Cryptocurrency;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.GenericType;
import java.util.List;

public class CryptocurrencyService {
    private WebTarget webTarget;
    private jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/sob-cryptocurrency-explorer/rest/api/v1/cryptocurrency/";
    
    public CryptocurrencyService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }
    
    public List<Cryptocurrency> getAllCryptocurrencies() {
        Response response = webTarget
                .request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<List<Cryptocurrency>>() {});
        }
        return null;
    }
    
    public List<Cryptocurrency> getAllCryptocurrenciesSortedByPrice(String order) {
        Response response = webTarget
                .queryParam("order", order)
                .request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<List<Cryptocurrency>>() {});
        }
        return null;
    }
    
    public Purchase getCryptocurrencyById(int id) {
        Response response = webTarget
                .path(String.valueOf(id))
                .request(MediaType.APPLICATION_JSON)
                .get();
        return response.readEntity(Purchase.class);
    }
}
