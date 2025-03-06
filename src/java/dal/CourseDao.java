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

    try  {
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
    public static void main(String[] args) {
        CourseDao courseDAO = new CourseDao();
        List<Courses> result = courseDAO.searchCoursesByName("Java Core");
         if (result.isEmpty()) {
                System.out.println("Không tìm thấy khóa học nào.");
            } else {
                for (Courses course : result) {
                    System.out.println("ID: " + course.getCourseID() +
                            ", Tên: " + course.getName() +
                            ", Mô tả: " + course.getDescription() +
                            ", Giá: " + course.getPrice());
                }
            }
    }

    

}
