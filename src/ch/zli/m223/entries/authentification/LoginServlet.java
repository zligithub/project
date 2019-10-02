package ch.zli.m223.entries.authentification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch.zli.m223.entries.authentification.*;

/**
 * @email Ramesh Fadatare
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1 L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        LoginBean loginBean = new LoginBean();
        loginBean.setName(name);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
                //HttpSession session = request.getSession();
                // session.setAttribute("name",name);
                response.sendRedirect("Lists.jsp");
            } else {
                HttpSession session = request.getSession();
                //session.setAttribute("user", name);
                //response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}