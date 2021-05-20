package com.aimorc.ajax;



import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aimorc.ajax.JDBCPostgreSQLConnect;

import org.json.simple.JSONObject;

public class PostgressDBOperations {
	
	public boolean validateAccountWithUsernamePassword(String parsedusername, String parsedpassword)
			throws ClassNotFoundException, SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		PreparedStatement passwordstatment = null;
		ResultSet passwordresultset = null;

		try {
			// Step 2: Opening database connection
			connection = JDBCPostgreSQLConnect.getConnection();
			// Step 2.B: Creating JDBC Statement
			preparedStatement = connection.prepareStatement("select * from login where username = ?");
			preparedStatement.setString(1, parsedusername);

			// Step 2.C: Executing SQL & retrieve data into ResultSet
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				passwordstatment = connection.prepareStatement("select * from login where username = ? and password = ?");
				passwordstatment.setString(1, parsedusername);
				passwordstatment.setString(2, parsedpassword);
				passwordresultset = passwordstatment.executeQuery();
				while (passwordresultset.next()) {
					return true;
				}
			}

		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			// Step 3: Closing database connection
			try {

				if (null != resultSet) {
					resultSet.close();
				}

				if (null != preparedStatement) {
					// cleanup resources, once after processing
					preparedStatement.close();
				}

				if (null != passwordstatment) {
					passwordstatment.close();
				}

				if (null != passwordresultset) {
					passwordresultset.close();
				}

				if (null != connection) {
					// and then finally close connection
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}
		return false;
	}

	@SuppressWarnings("null")
	public boolean checkIfUsernameExist(String parsedusername) throws ClassNotFoundException, SQLException {

		// variables
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {// Step 2: Opening database connection
			connection = JDBCPostgreSQLConnect.getConnection();
			// Step 2.B: Creating JDBC Statement
			preparedStatement = connection.prepareStatement("select * from login where username = ?");
			preparedStatement.setString(1, parsedusername);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				return true;
			}

		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		}

		finally {
			// Step 3: Closing database connection
			try {

				if (null != resultSet) {
					resultSet.close();
				}

				if (null != preparedStatement) {
					// cleanup resources, once after processing
					preparedStatement.close();
				}
				if (null != connection) { // and then finally close connection
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}
		return false;
	}

	public boolean registerUserAccount(JSONObject jsonObject) throws ParseException, ClassNotFoundException, SQLException {

		// variables
		Connection connection = null;
		PreparedStatement prepStatement = null;
		ResultSet resultSet = null;

		try {
			// Step 2: Opening database connection
			connection = JDBCPostgreSQLConnect.getConnection();
			
			// Step 2.B: Creating JDBC Statement
			String username =  (String) jsonObject.get("username");
			prepStatement = connection.prepareStatement("select userid from login where username = ?");
			prepStatement.setString(1, username);

			// Step 2.C: Executing SQL
			resultSet = prepStatement.executeQuery();
					
			int userid = 0;
			while (resultSet.next()) {
				userid = resultSet.getInt(1);
			}
			
			String query = "insert into registration (userid,firstname, lastname,dob,gender,phonenum,address,created_on) values (?,?, ?, ?, ?, ?, ?,?)";
			prepStatement = connection.prepareStatement(query);
			prepStatement.setInt(1,userid );
			prepStatement.setString(2, (String) jsonObject.get("firstname"));
			prepStatement.setString(3, (String) jsonObject.get("lastname"));
			prepStatement.setString(4, (String) jsonObject.get("dob"));
			prepStatement.setString(5, (String) jsonObject.get("gender"));
			prepStatement.setString(6, (String) jsonObject.get("phonenum"));
			prepStatement.setString(7, (String) jsonObject.get("address"));
			prepStatement.setString(8, (String) jsonObject.get("created_on"));
			
			// Step 2.C: Executing SQL
			prepStatement.executeUpdate();

		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			// Step 3: Closing database connection
			try {
				if (null != connection) {
					// cleanup resources, once after processing
					prepStatement.close();

					// and then finally close connection
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean loginUserAccount(JSONObject jsonObject) throws ParseException, ClassNotFoundException, SQLException {

		// variables
		Connection connection = null;
		PreparedStatement prepStatement = null;

		// Step 2.B: Creating JDBC Statement
		try {
			String lastlogin = (String) jsonObject.get("created_on");
			
			// Step 2: Opening database connection
			connection = JDBCPostgreSQLConnect.getConnection();
			String query = "insert into login (username, password, lastlogin) values (?, ?, ?)";
			prepStatement = connection.prepareStatement(query);
			prepStatement.setString(1, (String) jsonObject.get("username"));
			prepStatement.setString(2, (String) jsonObject.get("password"));
			prepStatement.setString(3, lastlogin);
		
			// Step 2.C: Executing SQL
			prepStatement.executeUpdate();
			return true;
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			// Step 3: Closing database connection
			try {
				if (null != connection) {
					// cleanup resources, once after processing
					prepStatement.close();

					// and then finally close connection
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}
		return false;
	}

	
	public Map displayProfile(String username) throws ClassNotFoundException, SQLException {

		// variables
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
		// Step 2: Opening database connection
		connection = JDBCPostgreSQLConnect.getConnection();


		// Step 2.C: Creating JDBC Statement
		preparedStatement = connection.prepareStatement(
		"select r.firstname, r.lastname, r.dob, r.gender, r.phonenum, r.address"
		+ " from registration r "
		+ "join login l on l.userid = r.userid "
		+ "where l.username = ?");
		preparedStatement.setString(1, username );

		// Step 2.C: Executing SQL
		resultSet = preparedStatement.executeQuery();

		Map<String,String> individualUser = new HashMap <String, String>();

		while (resultSet.next()) {

			individualUser.put("firstName", resultSet.getString(1));
			individualUser.put("lastName", resultSet.getString(2));
			individualUser.put("dob", resultSet.getString(3));
			individualUser.put("gender", resultSet.getString(4));
			individualUser.put("phonenum", resultSet.getString(5));
			individualUser.put("address", resultSet.getString(6));

			}

	

		return individualUser;

		} catch (SQLException sqlex) {
		sqlex.printStackTrace();
		} finally {
		// Step 3: Closing database connection
		try {

		if (null != resultSet) {
		resultSet.close();
		}

		if (null != preparedStatement) {
		// cleanup resources, once after processing
		preparedStatement.close();
		}

		if (null != connection) {
		// and then finally close connection
		connection.close();

		}
		} catch (SQLException sqlex) {
		sqlex.printStackTrace();
		}
		}
		return null;
		}
}