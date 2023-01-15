package cat.urv.deim.sob.command;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class logOutCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("sessionEmail", null);
        request.getSession().setAttribute("sessionPassword", null);
        request.getSession().setAttribute("sessionCustomerId", null);
        
        String view;
        
        String from = (String) request.getParameter("from");

        if (from != null)
            view = from;
        else
            view = "listAllCryptocurrencies.do";
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
    
}
