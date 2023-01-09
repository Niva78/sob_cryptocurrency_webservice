/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.urv.deim.sob.command;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author nicol
 */
public class logOutCommand implements Command{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("sessionEmail", null);
        request.getSession().setAttribute("sessionPassword", null);
        request.getSession().setAttribute("sessionCustomerId", null);
        
        String from = (String) request.getParameter("from");
        String view = from;

        if (from != null)
            view = from;
        else
            view = "listAllCryptocurrency.do";
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
    
}
