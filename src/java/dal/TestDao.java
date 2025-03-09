/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Test;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
/**
 *
 * @author Administrator
 */
public class TestDao extends DBContext{
     public List<Test> getQuestionsByTestID(int testID) {
        List<Test> questions = new ArrayList<>();
        String sql = "SELECT q.QuestionID, q.QuestionType, q.QuestionContent, " +
                     "q.OptionA, q.OptionB, q.OptionC, q.OptionD, q.AnswerID " +
                     "FROM Test_Question tq " +
                     "JOIN Question q ON tq.QuestionID = q.QuestionID " +
                     "WHERE tq.TestID = ?";

        try  {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, testID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                questions.add(new Test(
                    rs.getInt("QuestionID"),
                    rs.getString("QuestionType"),
                    rs.getString("QuestionContent"),
                    rs.getString("OptionA"),
                    rs.getString("OptionB"),
                    rs.getString("OptionC"),
                    rs.getString("OptionD"),
                    rs.getInt("AnswerID")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
      public static void main(String[] args) {
        // Test với ID bất kỳ
        int testID = 1;  

        // Khởi tạo TestDao
        TestDao testDao = new TestDao();

        // Gọi phương thức lấy danh sách câu hỏi
        List<Test> questions = testDao.getQuestionsByTestID(testID);

        // Kiểm tra dữ liệu có lấy được không
        if (questions.isEmpty()) {
            System.out.println("Không tìm thấy câu hỏi nào cho Test ID: " + testID);
        } else {
            System.out.println("Danh sách câu hỏi của Test ID " + testID + ":");
            for (Test question : questions) {
                System.out.println("ID: " + question.getQuestionID());
                System.out.println("Loại: " + question.getQuestionType());
                System.out.println("Nội dung: " + question.getQuestionContent());
                System.out.println("A: " + question.getOptionA());
                System.out.println("B: " + question.getOptionB());
                System.out.println("C: " + question.getOptionC());
                System.out.println("D: " + question.getOptionD());
                System.out.println("Đáp án đúng: " + question.getAnswerID());
                System.out.println("------------------------------");
            }
        }
    }
}
