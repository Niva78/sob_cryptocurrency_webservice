/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.urv.deim.sob.command;

import cat.urv.deim.sob.command.Command;
import cat.urv.deim.sob.model.Cryptocurrency;
import cat.urv.deim.sob.service.CryptocurrencyService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Jarvis
 */
public class listAllCryptocurrency implements Command{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CryptocurrencyService service = new CryptocurrencyService();
        String view = "views/listAllCryptocurrency.jsp";
        
        List<Cryptocurrency> cryptocurrencyList = service.listAllCryptocurrency();
        
        request.setAttribute("cryptocurrencyList", cryptocurrencyList);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
    
}
