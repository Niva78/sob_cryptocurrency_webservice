/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.urv.deim.sob.service;

import cat.urv.deim.sob.model.Cryptocurrency;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.core.GenericType;
import java.util.List;

/**
 *
 * @author Jarvis
 */
public class CryptocurrencyService {
    private WebTarget webTarget;
    private jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/sob-cryptocurrency-explorer/";
    
    public CryptocurrencyService(){
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("rest/api/v1/cryptocurrency/");
    }
    
    public List<Cryptocurrency> listAllCryptocurrency(){
        Response response = webTarget.request(MediaType.APPLICATION_JSON)
                .get();
        //if(response.getStatus() == 201){
        //    return response.readEntity(new GenericType<List<Cryptocurrency>>() {});
        //}
        return response.readEntity(new GenericType<List<Cryptocurrency>>() {});
    }
}
