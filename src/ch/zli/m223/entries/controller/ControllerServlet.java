package ch.zli.m223.entries.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch.zli.m223.entries.User;
import ch.zli.m223.entries.Entry;
import ch.zli.m223.entries.DAO.EntryDAO;
import ch.zli.m223.entries.DAO.UserDAO;

//UserRequests

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EntryDAO entryDAO;
	private UserDAO userDAO;

	public void init() {
		
		
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		entryDAO = new EntryDAO(jdbcURL, jdbcUsername, jdbcPassword);
		userDAO = new UserDAO(jdbcURL, jdbcUsername, jdbcPassword);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/new2":
				showNewUserForm(request, response);
				break;
			case "/insert":
				insertEntry(request, response);
				break;
			case "/delete":
				deleteEntry(request, response);
				break;
			case "/insert2":
				insertUser(request, response);
				break;
			case "/delete2":
				deleteUser(request, response);
				break;
				
			case "/edit":
				showEditForm(request, response);
				break;
				
			case "/edit2":
				showEditUserForm(request, response);
				break;
				//todo:
			case "/update":
				updateEntry(request, response);
				break;
			case "/update2":
				updateUser(request, response);
				break;
			case "/listUser":
				listUser(request, response);
				break;
			default:
				listEntry(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void updateEntry(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String text = request.getParameter("text");

		Entry Entry = new Entry(id, title, text);
		entryDAO.updateEntry(Entry); 		
		response.sendRedirect("list");
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("EntryForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Entry existingEntry = entryDAO.getEntry(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("EntryForm.jsp");
		request.setAttribute("entry", existingEntry);
		dispatcher.forward(request, response);

	}

	private void insertEntry(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		Entry newEntry = new Entry(title, text);
		entryDAO.insertEntry(newEntry);
		response.sendRedirect("list");
	}
	
	private void deleteEntry(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Entry entry = new Entry(id);
		entryDAO.deleteEntry(entry);
		response.sendRedirect("list");

	}
	
	private void listEntry(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		List<Entry> listEntry = entryDAO.listAllEntries();
		request.setAttribute("listEntry", listEntry);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Lists.jsp");
		dispatcher.forward(request, response);
	}
	
//User Part
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		User User = new User(id, name, password);
		userDAO.updateUser(User); 		
		response.sendRedirect("list");
	}
	
	private void showNewUserForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditUserForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDAO.getUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserForm.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);

	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		User newUser = new User(name, password);
		userDAO.insertUser(newUser);
		response.sendRedirect("list");
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		User user = new User(id);
		userDAO.deleteUser(user);
		response.sendRedirect("list");

	}
	
	private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		List<User> listUser = userDAO.listAllUsers();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Lists.jsp");
		dispatcher.forward(request, response);
	}


}
