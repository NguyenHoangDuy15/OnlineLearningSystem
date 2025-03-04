package dal;

import Model.User;
import java.util.*;
import java.lang.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.MaHoa;

public class UserDAO extends DBContext {

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        MaHoa m = new MaHoa();
        System.out.println(m.toSHA1("theanh"));
        System.out.println(dao.check("theanh", m.toSHA1("theanh")));
        //dao.add("123", "123", "123", "123");
    }

    public void add(String user, String pass, String name, String email) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([FullName]\n"
                + "           ,[UserName]\n"
                + "           ,[Email]\n"
                + "           ,[Password]\n"
                + "           ,[RoleID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,4)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, user);
            st.setString(3, email);
            st.setString(4, pass);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [UserID]\n"
                + "      ,[FullName]\n"
                + "      ,[UserName]\n"
                + "      ,[Email]\n"
                + "      ,[Password]\n"
                + "      ,[RoleID]\n"
                + "  FROM [dbo].[Users]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("UserID"), rs.getString("FullName"),
                        rs.getString("UserName"), rs.getString("Email"),
                        rs.getString("Password"), rs.getInt("RoleID"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User check(String username, String password) {
        String sql = "SELECT [UserID]\n"
                + "      ,[FullName]\n"
                + "      ,[UserName]\n"
                + "      ,[Email]\n"
                + "      ,[Password]\n"
                + "      ,[RoleID]\n"
                + "  FROM [dbo].[Users]\n"
                + "  WHERE [UserName]= ? and [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User a = new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void changePass(String pass, int id) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [Password] = ?\n"
                + " WHERE [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User checkWithGmail(String username, String mail) {
        String sql = "SELECT [UserID]\n"
                + "      ,[FullName]\n"
                + "      ,[UserName]\n"
                + "      ,[Email]\n"
                + "      ,[Password]\n"
                + "      ,[RoleID]\n"
                + "  FROM [dbo].[Users]\n"
                + "  WHERE [UserName]= ? and [Email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, mail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User a = new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
