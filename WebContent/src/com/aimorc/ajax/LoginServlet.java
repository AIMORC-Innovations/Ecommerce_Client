package com.aimorc.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().write("welcome to DoGet of LoginServlet");

	}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String jsonString = "";
		
		if(bufferedReader != null){
			jsonString = bufferedReader.readLine();
		}
		System.out.println("Recieved JSON :"+ jsonString);

		try {
			Object paresedJSONObject = new JSONParser().parse(jsonString);
			JSONObject jsonObject = (JSONObject) paresedJSONObject;
			
			String parsedusername = (String) jsonObject.get("username");
			String parsedpassword = (String) jsonObject.get("password");
			String parsedlastlogin = (String) jsonObject.get("lastlogin");
			
			String 	statusMessage = "";
			
			PostgressDBOperations operations = new PostgressDBOperations();
			
			if (operations.checkIfUsernameExist(parsedusername)) {
				if (operations.validateAccountWithUsernamePassword(parsedusername, parsedpassword)) {
					statusMessage = "User Succesfully Logged in";

					HttpSession session = request.getSession();
					session.setAttribute("username", parsedusername);
					String name = (String) session.getAttribute("username");
					System.out.println(name);
					System.out.println("Session Id:" + session.getId());

					RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
					dispatcher.forward(request, response);

					try {
						response.getWriter().write(statusMessage);
					
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else {
					statusMessage = "Password is incorrect, Please enter the correct Password";
					response.getWriter().write(statusMessage);
					return;
				}
			}
			response.getWriter().write(statusMessage);
			
									
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}