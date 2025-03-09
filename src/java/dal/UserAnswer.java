package dal;

import Model.Answer_U;
import java.sql.*;

public class UserAnswer extends DBContext {

    public void insertUserAnswer(Answer_U ua) {
        String sql = "INSERT INTO UserAnswers (UserID, TestID, QuestionID, AnswerID) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ua.getUserId());
            ps.setInt(2, ua.getTestId());
            ps.setInt(3, ua.getQuestionId());
            ps.setInt(4, ua.getAnswerId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Tính tổng điểm của người dùng
    public int getTotalMark(int userId, int testId) {
        String sql = "SELECT COUNT(ua.QuestionID) AS TotalMark\n"
                + "FROM UserAnswers ua\n"
                + "JOIN Question q ON ua.QuestionID = q.QuestionID\n"
                + "WHERE ua.TestID = ?\n"
                + "AND ua.AnswerID = q.AnswerID \n"
                + "AND ua.UserID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, testId);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalMark");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateTestStatus(int testId) {
        String sql = "UPDATE Test SET Status = 1 WHERE TestID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, testId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
