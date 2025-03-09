package local.UserController;

import Model.User;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.MaHoa;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        UserDAO d = new UserDAO();
        String pass = MaHoa.toSHA1(p);
        User a = d.check(u, pass);
        HttpSession sec = request.getSession();

        if (a == null) {  // Hợp nhất logic từ cả hai nhánh
            sec.setAttribute("isLoggedIn", false);
            request.setAttribute("err", "Username or password invalid " + pass);
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
        } else if (a.getStatus() == 0) {
            sec.setAttribute("isLoggedIn", false);
            request.setAttribute("err", "Your account was banned");
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
        } else {
            sec.setAttribute("account", a);
            sec.setAttribute("isLoggedIn", true);
            sec.setAttribute("userid", a.getUserID());
            sec.setAttribute("sessionID", sec.getId());
            sec.setAttribute("rollID", a.getRoleID()); // Thêm rollID vào session
            request.setAttribute("rollID", a.getRoleID());
            if (a.getRoleID() == 1) {
                response.sendRedirect("ShowAdminDasboardServlet");
            }
            else if (a.getRoleID() == 3) {
                response.sendRedirect("viewownerbloglist");
                sec.setAttribute("isSale", true);
            } else {
                response.sendRedirect("index");
            }

        }
    }

}
