package cat.urv.deim.sob.command;

import cat.urv.deim.sob.model.Purchase;
import cat.urv.deim.sob.service.CryptocurrencyService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class cryptocurrencyCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CryptocurrencyService service = new CryptocurrencyService();
        String view = "views/cryptocurrency.jsp";
        
        int id = Integer.parseInt(request.getParameter("id"));
        Purchase p = service.getCryptocurrencyById(id);
        
        request.setAttribute("purchase", p);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }

}
