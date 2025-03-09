/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package local.UserController;

import dal.TestDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Administrator
 */
public class Test extends HttpServlet {
   
 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int testID = Integer.parseInt(request.getParameter("testId"));
        TestDao questionDAO = new TestDao();
        List<Model.Test> questions = questionDAO.getQuestionsByTestID(testID);

        HttpSession session = request.getSession();
        session.setAttribute("questions", questions);
        session.setAttribute("userAnswers", new HashMap<Integer, String>());

        request.setAttribute("questions", questions);
        request.getRequestDispatcher("jsp/Test.jsp?index=0").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Test> questions = (List<Test>) session.getAttribute("questions");
        Map<Integer, String> userAnswers = (Map<Integer, String>) session.getAttribute("userAnswers");

        int currentIndex = Integer.parseInt(request.getParameter("currentIndex"));
        int questionID = Integer.parseInt(request.getParameter("questionID"));
        String selectedAnswer = request.getParameter("answer");

        if (selectedAnswer != null) {
            userAnswers.put(questionID, selectedAnswer);
        }

        session.setAttribute("userAnswers", userAnswers);

        String action = request.getParameter("action");
        if ("previous".equals(action)) {
            currentIndex--;
        } else if ("next".equals(action)) {
            currentIndex++;
        } else if ("submit".equals(action)) {
          
            request.getRequestDispatcher("jsp/Result.jsp").forward(request, response);
            return;
        }

        request.setAttribute("questions", questions);
        request.setAttribute("userAnswers", userAnswers);
      request.getRequestDispatcher("jsp/Test.jsp?index=" + currentIndex).forward(request, response);

  

}
}
