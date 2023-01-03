package cat.urv.deim.sob.service;

import cat.urv.deim.sob.model.Customer;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.core.HttpHeaders;
import java.util.Base64;

public class CustomerService {
    private WebTarget webTarget;
    private jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/sob-cryptocurrency-explorer/rest/api/v1/";

    public CustomerService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }

    public boolean validateCustomer(String email, String password) {
        String credentials = email + ":" + password;
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes()) + " ==";
        Response response = webTarget.path("customer/validate")
                .request()
                .header(HttpHeaders.AUTHORIZATION, "Basic " + encodedCredentials)
                .get();
        return response.getStatus() == 200;
    }

}
