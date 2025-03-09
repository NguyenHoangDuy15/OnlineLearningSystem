/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.CustomerCourse;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class CustomerDao extends DBContext {

    public List<CustomerCourse> getAllCourses() {
        List<CustomerCourse> courses = new ArrayList<>();
        String sql = "SELECT "
                + "c.CourseID, "
                + "c.Name AS CourseName, "
                + "c.imageCources, "
                + "u.FullName AS ExpertName, "
                + "c.Price, "
                + "COALESCE(AVG(f.Rating), 0) AS AverageRating, "
                + "COUNT(f.Rating) AS TotalReviews "
                + "FROM Courses c "
                + "INNER JOIN Users u ON c.UserID = u.UserID "
                + "LEFT JOIN Feedbacks f ON c.CourseID = f.CourseID "
                + "GROUP BY c.CourseID, c.Name, c.imageCources, u.FullName, c.Price;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                courses.add(new CustomerCourse(
                        rs.getInt("CourseID"),
                        rs.getString("CourseName"),
                        rs.getFloat("Price"),
                        rs.getString("ExpertName"),
                        rs.getString("imageCources")// Đổi Instructor thành ExpertName
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public static void main(String[] args) {
        // Tạo danh sách giả lập dữ liệu
        List<CustomerCourse> courses = new ArrayList<>();
        courses.add(new CustomerCourse(1, "Java Basics", 99.99f, "John Doe", "java.jpg"));
        courses.add(new CustomerCourse(2, "Python for Beginners", 79.99f, "Alice Smith", "python.jpg"));
        courses.add(new CustomerCourse(3, "Web Development", 119.99f, "Bob Johnson", "web.jpg"));

        // In danh sách khóa học ra màn hình
        for (CustomerCourse course : courses) {
            System.out.println("ID: " + course.getCourseId());
            System.out.println("Tên: " + course.getCourseName());
            System.out.println("Giá: " + course.getPrice());
            System.out.println("Chuyên gia: " + course.getInstructor());
            System.out.println("Ảnh: " + course.getImage());
            System.out.println("--------------------------");
        }
    }
}
