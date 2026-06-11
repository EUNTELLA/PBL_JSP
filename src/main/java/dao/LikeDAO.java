package dao;

import java.sql.*;
import javax.naming.NamingException;
import util.*;

public class LikeDAO {
    public boolean isLiked(int feedNo, String uid) throws NamingException, SQLException {
        if (uid == null) return false;
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT feed_no FROM feed_like WHERE feed_no = ? AND id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, feedNo);
            stmt.setString(2, uid);
            rs = stmt.executeQuery();
            return rs.next();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    public int getCount(int feedNo) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT COUNT(*) FROM feed_like WHERE feed_no = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, feedNo);
            rs = stmt.executeQuery();
            if (!rs.next()) return 0;
            return rs.getInt(1);
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    public void toggle(int feedNo, String uid) throws NamingException, SQLException {
        if (uid == null) return;
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            if (isLiked(feedNo, uid)) {
                String sql = "DELETE FROM feed_like WHERE feed_no = ? AND id = ?";
                stmt = conn.prepareStatement(sql);
            } else {
                String sql = "INSERT INTO feed_like(feed_no, id) VALUES(?, ?)";
                stmt = conn.prepareStatement(sql);
            }
            stmt.setInt(1, feedNo);
            stmt.setString(2, uid);
            stmt.executeUpdate();
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
}
