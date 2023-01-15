package cat.urv.deim.sob.command;

import cat.urv.deim.sob.service.CustomerService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class loginCommand implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerService service = new CustomerService();
        String view;
        
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        
        String from = (String) request.getParameter("from");
        if (from != null)
            view = from;
        else
            view = "listAllCryptocurrencies.do";

        Integer customerId = service.validateCustomer(email, password);
        
        if (customerId != null) {
            request.getSession().setAttribute("sessionEmail", email);
            request.getSession().setAttribute("sessionPassword", password);
            request.getSession().setAttribute("sessionCustomerId", customerId);
        } else {
            view = "views/login.jsp";
            request.getSession().setAttribute("sessionEmail", null);
            request.setAttribute("message", "Invalid credentials");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
}
