
 import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class loginServlet extends HttpServlet {


    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        
        if(Validate.checkUser(email, pass))
        {
            RequestDispatcher rs = req.getRequestDispatcher("demo");
            rs.forward(req, resp);
        }
        else
        {
           out.println("Username or Password incorrect");
           RequestDispatcher rs = req.getRequestDispatcher("index.html");
           rs.include(req, resp);
        }
    }
}
