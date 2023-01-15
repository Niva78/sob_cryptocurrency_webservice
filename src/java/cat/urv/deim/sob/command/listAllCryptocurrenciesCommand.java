package cat.urv.deim.sob.command;

import cat.urv.deim.sob.model.Cryptocurrency;
import cat.urv.deim.sob.service.CryptocurrencyService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class listAllCryptocurrenciesCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CryptocurrencyService service = new CryptocurrencyService();
        String view = "views/listAllCryptocurrencies.jsp";
        
        String order = (String) request.getParameter("order");
        
        List<Cryptocurrency> cryptocurrencyList;
        if (order != null && (order.equals("asc") || order.equals("desc")))
            cryptocurrencyList = service.getAllCryptocurrenciesSortedByPrice(order);
        else
            cryptocurrencyList = service.getAllCryptocurrencies();
        
        request.setAttribute("cryptocurrencyList", cryptocurrencyList);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
    
}
