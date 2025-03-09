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
}
