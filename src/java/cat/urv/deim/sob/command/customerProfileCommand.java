package cat.urv.deim.sob.command;

import cat.urv.deim.sob.model.Customer;
import cat.urv.deim.sob.model.Purchase;
import cat.urv.deim.sob.service.CustomerService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class customerProfileCommand implements Command{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService customerService = new CustomerService();
        String view = "views/customerProfile.jsp";
        
        Integer customerId = (Integer)request.getSession().getAttribute("sessionCustomerId");
        
        Customer customer = customerService.findCustomerById(customerId);
        request.setAttribute("customer", customer);
        
        String email = (String) request.getSession().getAttribute("sessionEmail");
        String password = (String) request.getSession().getAttribute("sessionPassword");
        List<Purchase> purchaseList = customerService.getCustomerPurchases(email, password);
        request.setAttribute("purchaseList", purchaseList);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }

}
