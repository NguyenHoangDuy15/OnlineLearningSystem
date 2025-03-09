/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import Model.Lesson;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class LessonsDao extends DBContext {

   
   public List<Lesson> getLessonsAndTests(int courseId, int userId) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT 'Lesson' AS Type, l.LessonID AS ID, l.Title AS Name, " +
                     "NULL AS TotalMark, l.Content, l.Status " +
                     "FROM Lessons l WHERE l.CourseID = ? " +
                     "UNION ALL " +
                     "SELECT 'Test' AS Type, t.TestID AS ID, t.Name AS Name, t.TotalMark, " +
                     "NULL AS Content, " +
                     "CASE WHEN EXISTS (SELECT 1 FROM UserAnswers ua WHERE ua.TestID = t.TestID AND ua.UserID = ?) " +
                     "THEN 'Completed' ELSE t.Status END AS Status " +
                     "FROM Test t WHERE t.CourseID = ?";

        try  {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            ps.setInt(2, userId);
            ps.setInt(3, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Lesson(
                        rs.getString("Type"),
                        rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getFloat("TotalMark"),
                        rs.getString("Content"),
                        rs.getString("Status")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) {
        LessonsDao dao = new LessonsDao();
        
        int courseId = 1; // Thay bằng ID khóa học thực tế
        int userId = 6;   // Thay bằng ID người dùng thực tế
        
        List<Lesson> lessons = dao.getLessonsAndTests(courseId, userId);

        for (Lesson lesson : lessons) {
            System.out.println(lesson);
        }
    }
}
