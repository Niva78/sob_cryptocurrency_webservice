package cat.urv.deim.sob.command;

import cat.urv.deim.sob.model.Purchase;
import cat.urv.deim.sob.service.PurchaseService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class purchaseCommand implements Command{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double purchasedAmount = Double.valueOf(request.getParameter("purchasedAmount"));
        int criptoId = Integer.valueOf(request.getParameter("id"));
        String email = (String) request.getSession().getAttribute("sessionEmail");
        String password = (String) request.getSession().getAttribute("sessionPassword");
        
        String view = "views/succesfulPurchase.jsp";

        System.out.println(request.getParameter("purchasedAmount"));
        
        PurchaseService service = new PurchaseService();
        
        Purchase purchase = service.makePurchase(criptoId, purchasedAmount, email, password);
        
        request.setAttribute("purchase", purchase);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
    
}
