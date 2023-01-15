package cat.urv.deim.sob.command;

import cat.urv.deim.sob.model.Purchase;
import cat.urv.deim.sob.service.CryptocurrencyService;
import cat.urv.deim.sob.service.PurchaseService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class cryptocurrencyCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = "views/cryptocurrency.jsp";
        
        if (request.getParameter("purchasedAmount") != null) {
            double purchasedAmount = Double.valueOf(request.getParameter("purchasedAmount"));
            int criptoId = Integer.valueOf(request.getParameter("id"));
            String email = (String) request.getSession().getAttribute("sessionEmail");
            String password = (String) request.getSession().getAttribute("sessionPassword");
            Purchase purchase = new PurchaseService().makePurchase(criptoId, purchasedAmount, email, password);
            if (purchase != null) {
                request.setAttribute("currentPurchase", purchase);
            }
        }
        
        System.out.println(request.getSession().getAttribute("sessionEmail"));
        System.out.println(request.getSession().getAttribute("sessionPassword"));
        System.out.println(request.getSession().getAttribute("sessionCustomerId"));
        
        int id = Integer.parseInt(request.getParameter("id"));
        Purchase p = new CryptocurrencyService().getCryptocurrencyById(id);
        request.setAttribute("purchase", p);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }

}
