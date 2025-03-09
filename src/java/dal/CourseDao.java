/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import Model.Courses;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class CourseDao extends DBContext {

    public List<Courses> searchCoursesByName(String keyword) {
        List<Courses> courses = new ArrayList<>();
        String sql = "SELECT * FROM Courses WHERE Name LIKE ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                courses.add(new Courses(
                        rs.getInt("CourseID"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getFloat("Price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public List<Courses> getAllCourses() {
        List<Courses> courses = new ArrayList<>();
        String query = "SELECT CourseID, Name, Description, imageCources FROM Courses";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                courses.add(new Courses(
                        rs.getInt("CourseID"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("imageCources")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courses;
    }

    public Courses getCourseById(int courseId) {
        String query = "SELECT CourseID, Name, Description, imageCources FROM Courses WHERE CourseID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Courses(
                            rs.getInt("CourseID"),
                            rs.getString("Name"),
                            rs.getString("imageCources"),
                            rs.getString("Description")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Courses getCourseDetails(int courseId) {
        Courses course = null;
        String sql = "SELECT c.CourseID, c.Name, u.FullName AS ExpertName, c.Price, "
                + "COALESCE(AVG(f.Rating), 0) AS AverageRating, COUNT(f.Rating) AS TotalReviews "
                + "FROM Courses c "
                + "JOIN Users u ON c.UserID = u.UserID "
                + "LEFT JOIN Feedbacks f ON c.CourseID = f.CourseID "
                + "WHERE c.CourseID = ? "
                + "GROUP BY c.CourseID, c.Name, u.FullName, c.Price";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course = new Courses(
                        rs.getInt("CourseID"),
                        rs.getString("Name"),
                        rs.getString("ExpertName"),
                        rs.getFloat("Price"),
                        rs.getDouble("AverageRating"),
                        rs.getInt("TotalReviews")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    public static void main(String[] args) {
        CourseDao courseDAO = new CourseDao(); // Thay thế bằng DAO của bạn nếu cần
        List<Courses> courses = courseDAO.getAllCourses();

        // In kết quả ra màn hình
        if (courses != null && !courses.isEmpty()) {
            for (Courses course : courses) {
                System.out.println("CourseID: " + course.getCourseID());
                System.out.println("Name: " + course.getName());
                System.out.println("Description: " + course.getDescription());
                System.out.println("Image: " + course.getImage());
                System.out.println("------");
            }
        } else {
            System.out.println("No courses found!");
        }
    }

}
