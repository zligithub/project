package ch.zli.m223.entries.entryDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import ch.zli.m223.entries.*;
import ch.zli.m223.entries.controller.*;

//Vorgänge in Datenbank crud...

public class EntryDAO {
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;
	
	public EntryDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}
	
	
	public Entry getEntry(int id) throws SQLException {
		Entry entry = null;
		String sql = "SELECT * FROM entry WHERE entry_id = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, id);
		
		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.next()) {
			String title = resultSet.getString("title");
			String text = resultSet.getString("text");			
			entry = new Entry(id, title, text);
		}
		
		resultSet.close();
		statement.close();
		
		return entry;
	}
	
	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
	}
	
	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	
	public List<Entry> listAllEntries() throws SQLException {
		List<Entry> listEntry = new ArrayList<>();
		
		String sql = "SELECT * FROM entry";
		
		connect();
		
		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
			int id = resultSet.getInt("entry_id");
			String title = resultSet.getString("title");
			String author = resultSet.getString("text");
			
			Entry entry = new Entry(id, title, author);
			listEntry.add(entry);
		}
		
		resultSet.close();
		statement.close();
		
		disconnect();
		
		return listEntry;
	}
	
	public boolean deleteEntry(Entry entry) throws SQLException {
		String sql = "DELETE FROM entry where entry_id = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, entry.getId());
		
		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowDeleted;		
	}
	
	public boolean updateEntry(Entry entry) throws SQLException {
		String sql = "UPDATE book SET title = ?, text = ?";
		sql += " WHERE entry_id = ?";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, entry.getTitle());
		statement.setString(2, entry.getText());
		statement.setInt(4, entry.getId());
		
		boolean rowUpdated = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowUpdated;		
	}
	
	public boolean insertEntry(Entry entry) throws SQLException {
		String sql = "INSERT INTO entry (title, text) VALUES (?, ?)";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, entry.getTitle());
		statement.setString(2, entry.getText());
		
		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowInserted;
	}
	
}
