package local.UserController;

import dal.TestDao;
import dal.UserAnswer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Model.Answer_U;
import Model.Test;

public class TestAnswer extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int testID;
        try {
            testID = Integer.parseInt(request.getParameter("testId"));
        } catch (NumberFormatException e) {

            return;
        }

        TestDao testDao = new TestDao();
        List<Test> questions = testDao.getQuestionsByTestID(testID);
        if (questions == null || questions.isEmpty()) {

            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("questions", questions);
        session.setAttribute("userAnswers", new HashMap<Integer, String>());
        session.setAttribute("testId", testID);

        session.setAttribute("questions", questions);
        request.setAttribute("currentIndex", 0);
        request.getRequestDispatcher("jsp/Test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Test> questions = (List<Test>) session.getAttribute("questions");
        Map<Integer, String> userAnswers = (Map<Integer, String>) session.getAttribute("userAnswers");
        Integer userId = (Integer) session.getAttribute("userid");
        Integer testId = (Integer) session.getAttribute("testId");

        if (userId == null || testId == null || questions == null || userAnswers == null) {
            response.sendRedirect("LoginServlet");
            return;
        }

        int currentIndex;
        try {
            currentIndex = Integer.parseInt(request.getParameter("currentIndex"));
        } catch (NumberFormatException e) {
            currentIndex = 0; // Đặt lại về 0 nếu có lỗi
        }

        int questionID;
        try {
            questionID = Integer.parseInt(request.getParameter("questionID"));
        } catch (NumberFormatException e) {
            return;
        }

        String selectedAnswer = request.getParameter("answer");
        if (selectedAnswer != null && !selectedAnswer.isEmpty()) {
            userAnswers.put(questionID, selectedAnswer);
        }

        session.setAttribute("userAnswers", userAnswers);

        String action = request.getParameter("action");
        if ("previous".equals(action) && currentIndex > 0) {
            currentIndex--;
        } else if ("next".equals(action) && currentIndex < questions.size() - 1) {
            currentIndex++;

        } else if ("submit".equals(action)) {
            UserAnswer uaDao = new UserAnswer();
            for (Map.Entry<Integer, String> entry : userAnswers.entrySet()) {
                Answer_U ua = new Answer_U(userId, testId, entry.getKey(), entry.getValue().charAt(0));
                uaDao.insertUserAnswer(ua);
            }

            int correctCount = uaDao.getTotalMark(userId, testId);
            uaDao.updateTestStatus(testId);

            request.setAttribute("correctCount", correctCount);
            request.setAttribute("totalQuestions", questions.size());
            request.getRequestDispatcher("jsp/Result.jsp").forward(request, response);
            return;
        }
  request.setAttribute("totalQuestions", questions.size());
        request.setAttribute("questions", questions);
        request.setAttribute("currentIndex", currentIndex);
        request.getRequestDispatcher("jsp/Test.jsp").forward(request, response);
    }
}
