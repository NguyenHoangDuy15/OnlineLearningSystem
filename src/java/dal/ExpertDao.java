/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Courses;
import Model.Expert;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class ExpertDao extends DBContext {
    
   public List<Expert> getAllInstructorCourses() {
        List<Expert> list = new ArrayList<>();
        String sql = "SELECT u.FullName AS username, c.Name AS course_name, u.Avartar " +
                     "FROM Users u " +
                     "JOIN Courses c ON u.UserID = c.UserID " +
                     "JOIN Roles r ON u.RoleID = r.RoleID " +
                     "WHERE r.RoleID = 2;"; // RoleID = 2 là giảng viên

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Expert(
                        rs.getString("username"),
                        rs.getString("course_name"),
                        rs.getString("Avartar")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
         ExpertDao expertDAO = new ExpertDao();
        List<Expert> experts = expertDAO.getAllInstructorCourses();

        // Hiển thị danh sách giảng viên và khóa học của họ
        for (Expert expert : experts) {
            System.out.println("Giảng viên: " + expert.getUsername() +
                               ", Khóa học: " + expert.getCourseName() +
                               ", Avatar: " + expert.getAvatar());
        }
    }
}
