package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.*;

public class FeedDAO {
	public boolean insert(String uid, String title, String ucon, String uimages) throws NamingException, SQLException {
	    Connection conn = ConnectionPool.get();
	    PreparedStatement stmt = null;
	    try {
	        String sql = "INSERT INTO feed(id, title, content, images) VALUES(?, ?, ?, ?)";
	        stmt = conn.prepareStatement(sql);
	        stmt.setString(1, uid);
	        stmt.setString(2, title);
	        stmt.setString(3, ucon);
	        stmt.setString(4, uimages);

	        int count = stmt.executeUpdate();
	        return (count == 1) ? true : false;

	    } finally {
	        if (stmt != null) stmt.close(); 
	        if (conn != null) conn.close();
	    }
	}

	public ArrayList<FeedObj> getList2() throws NamingException, SQLException {
	    Connection conn = ConnectionPool.get();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    try {
	        String sql = "SELECT * FROM feed ORDER BY ts DESC";
	        stmt = conn.prepareStatement(sql);
	        rs = stmt.executeQuery();

	        ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
	        while(rs.next()) {
	            feeds.add(new FeedObj(rs.getInt("no"), rs.getString("id"), rs.getString("title"), rs.getString("content"), rs.getString("ts"), rs.getString("images")));
	        }
	        return feeds;
	    } finally {
	        if (rs != null) rs.close();
	        if (stmt != null) stmt.close(); 
	        if (conn != null) conn.close();
	    }
	}

    public FeedObj getFeed(int no) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM feed WHERE no = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, no);
            rs = stmt.executeQuery();

            if (!rs.next()) return null;
            return new FeedObj(rs.getInt("no"), rs.getString("id"), rs.getString("title"), rs.getString("content"), rs.getString("ts"), rs.getString("images"));
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    public boolean update(int no, String uid, String title, String content) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "UPDATE feed SET title = ?, content = ? WHERE no = ? AND id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, no);
            stmt.setString(4, uid);

            int count = stmt.executeUpdate();
            return count == 1;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

    public boolean delete(int no, String uid) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM feed WHERE no = ? AND id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, no);
            stmt.setString(2, uid);

            int count = stmt.executeUpdate();
            return count == 1;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
	
	public ResultSet getList_old() throws NamingException, SQLException {
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    try {
	        String sql = "SELECT * FROM feed ORDER BY ts DESC";
	        conn = ConnectionPool.get();
	        stmt = conn.prepareStatement(sql);
	        return stmt.executeQuery();

	    } finally {
	        if (stmt != null) stmt.close(); 
	        if (conn != null) conn.close();
	    }
	}
}
