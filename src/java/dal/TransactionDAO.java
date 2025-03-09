/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Transaction;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
/**
 *
 * @author Administrator
 */
public class TransactionDAO extends DBContext{
public List<Transaction> getTransactionHistoryByUserId(int userId) {
        List<Transaction> historyList = new ArrayList<>();
        String sql = "SELECT t.TransactionID, p.UserID, t.CourseID, c.Name AS CourseName, " +
                     "p.Amount AS PaidAmount, t.PaymentMethod, t.Status, t.CreatedAt " +
                     "FROM TransactionHistory t " +
                     "JOIN Payment p ON t.PayID = p.PayID " +
                     "JOIN Courses c ON t.CourseID = c.CourseID " +
                     "WHERE t.Status = 1 AND p.UserID = ? " +
                     "ORDER BY t.CreatedAt ASC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Transaction th = new Transaction(
                        rs.getInt("TransactionID"),
                        rs.getInt("UserID"),
                        rs.getInt("CourseID"),
                        rs.getString("CourseName"),
                        rs.getDouble("PaidAmount"),
                        rs.getString("PaymentMethod"),
                        rs.getInt("Status"),
                        rs.getString("CreatedAt")
                    );
                    historyList.add(th);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historyList;
    }
    public static void main(String[] args) {
        TransactionDAO dao = new TransactionDAO();
            int userId = 6; // Thay đổi ID người dùng theo dữ liệu của bạn
            List<Transaction> historyList = dao.getTransactionHistoryByUserId(userId);

            for (Transaction th : historyList) {
                System.out.println(th);
            }
    }
}
