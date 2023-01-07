package cat.urv.deim.sob.service;

import cat.urv.deim.sob.model.Customer;
import cat.urv.deim.sob.model.Purchase;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.HttpHeaders;
import java.util.Base64;
import java.util.List;

public class CustomerService {
    private WebTarget webTarget;
    private jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/sob-cryptocurrency-explorer/rest/api/v1/customer";

    public CustomerService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }

    public Integer validateCustomer(String email, String password) {
        String credentials = email + ":" + password;
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes()) + " ==";
        Response response = webTarget
                .path("validate")
                .request()
                .header(HttpHeaders.AUTHORIZATION, "Basic " + encodedCredentials)
                .get();
        if (response.getStatus() == 200)
            return response.readEntity(Integer.class);
        return null;
    }
    
    public Customer findCustomerById(Integer id) {
        Response response = webTarget
                .path(String.valueOf(id))
                .request(MediaType.APPLICATION_JSON)
                .get();
        return response.readEntity(Customer.class);
    }

    public List<Purchase> getCustomerPurchases(String email, String password) {
        String credentials = email + ":" + password;
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes()) + " ==";
        Response response = webTarget
                .path("purchases")
                .request(MediaType.APPLICATION_JSON)
                .header(HttpHeaders.AUTHORIZATION, "Basic " + encodedCredentials)
                .get();
        return response.readEntity(new GenericType<List<Purchase>>() {});
    }

}
