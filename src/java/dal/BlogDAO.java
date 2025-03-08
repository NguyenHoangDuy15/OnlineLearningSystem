package dal;

/**
 *
 * @author DELL
 */
import Model.Blog;
import Model.User;
import java.util.*;
import java.lang.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BlogDAO extends DBContext {

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT [BlogID]\n"
                + "      ,[BlogTitle]\n"
                + "      ,[BlogDetail]\n"
                + "      ,[BlogImage]\n"
                + "      ,[BlogDate]\n"
                + "      ,[UserID]\n"
                + "  FROM [dbo].[Blogs]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("BlogID"), rs.getString("BlogTitle"),
                        rs.getString("BlogDetail"), rs.getString("BlogImage"),
                        rs.getDate("BlogDate"), rs.getInt("UserID"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
