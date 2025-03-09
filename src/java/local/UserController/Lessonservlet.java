/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package local.UserController;

import Model.Lesson;

import dal.LessonsDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class Lessonservlet extends HttpServlet {
@Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    HttpSession session = request.getSession();
     Integer userId = (Integer) session.getAttribute("userid");
    if (userId == null) {
        response.sendRedirect("LogoutServlet"); 
        return;
    }

 
    int courseId = Integer.parseInt(request.getParameter("courseId"));

   
    LessonsDao lessonDAO = new LessonsDao();
    List<Lesson> lessonsAndTests = lessonDAO.getLessonsAndTests(courseId, userId);

  
    request.setAttribute("lessonsAndTests", lessonsAndTests);

   
     request.getRequestDispatcher("jsp/lessons.jsp").forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

   
}
