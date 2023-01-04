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

        System.out.println(service.validateCustomer(email, password));
        if (service.validateCustomer(email, password)) {
            view = "listAllCryptocurrency.do";
            request.getSession().setAttribute("sessionEmail", email);
            request.getSession().setAttribute("sessionPassword", password);
        } else {
            view = "views/login.jsp";
            request.getSession().setAttribute("sessionEmail", null);
            request.setAttribute("message", "Invalid credentials");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
}
