/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import Model.Feedback;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public class FeedbackDao extends DBContext{
 
    public boolean insertFeedback(Feedback feedback) {
    String sql = "INSERT INTO Feedbacks (UserID, CourseID, Rating, Comment, CreatedAt) VALUES (?, ?, ?, ?, GETDATE())";
    try {
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, feedback.getUserId());
        stmt.setInt(2, feedback.getCourseId());
        stmt.setInt(3, feedback.getRating());
        stmt.setString(4, feedback.getComment());

        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
 public List<Feedback> getCustomerFeedbacks() {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT u.FullName AS CustomerName, c.Name AS CourseName, f.Comment AS Feedback " +
                     "FROM Feedbacks f " +
                     "JOIN Users u ON f.UserID = u.UserID " +
                     "JOIN Courses c ON f.CourseID = c.CourseID " +
                     "WHERE u.RoleID = 4"; // Chỉ lấy phản hồi từ khách hàng

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getString("CustomerName"),
                        rs.getString("CourseName"),
                        rs.getString("Feedback")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

  public static void main(String[] args) {
        // Tạo đối tượng DAL để gọi hàm
        FeedbackDao feedbackDAO = new FeedbackDao();

        // Gọi hàm lấy phản hồi của customer
        List<Feedback> feedbacks = feedbackDAO.getCustomerFeedbacks();

        // Kiểm tra dữ liệu
        if (feedbacks.isEmpty()) {
            System.out.println("Không có phản hồi nào từ khách hàng.");
        } else {
            System.out.println("Danh sách phản hồi từ khách hàng:");
            for (Feedback fb : feedbacks) {
                System.out.println("Tên khách hàng: " + fb.getCustomername());
                System.out.println("Tên khóa học: " + fb.getCourse());
                System.out.println("Phản hồi: " + fb.getComment());
                System.out.println("----------------------");
            }
        }
  }
}
    