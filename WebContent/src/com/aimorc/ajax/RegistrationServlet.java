package com.aimorc.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().write("welcome to DoGet of LoginServlet");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String jsonString = "";
		if (bufferedReader != null) {
			jsonString = bufferedReader.readLine();
		}
		System.out.println("Received JSON :"  +  jsonString );
		try {

			// JSON Parsing..
			Object paresedJSONObject = new JSONParser().parse(jsonString);
			JSONObject jsonObject = (JSONObject) paresedJSONObject;

			String parsedusername = (String) jsonObject.get("username");
			String parsedpassword = (String) jsonObject.get("password");
			 
			PostgressDBOperations operations = new PostgressDBOperations();
			String statusMessage = "";

			if (operations.checkIfUsernameExist(parsedusername)) {
				if (operations.validateAccountWithUsernamePassword(parsedusername, parsedpassword)) {
					statusMessage = "Account already exist, Please Login";
					response.getWriter().write(statusMessage);
					throw new Exception("User Account Already exist");
				}
				else {
					statusMessage = "Account exist but incorrect password is provided, Please enter the correct password and login";
					response.getWriter().write(statusMessage);
					return;
				}
			}else {
				operations.loginUserAccount(jsonObject);
				 operations.registerUserAccount(jsonObject);
				 statusMessage = "User Succecssfully registered!";
				response.getWriter().write(statusMessage);
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

