package com.aimorc.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect.Type;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProfileServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().write("welcome to DoGet of ProfileServlet");

	}

protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.setContentType("text/html");
		//response.setContentType("application/json");
		// response.setHeader("cache-control", "no-cache");
	   System.out.println("hello");
	    PrintWriter out = response.getWriter();
       HttpSession session = request.getSession(false);
		   if(session!=null){  
			   System.out.println("Session Id:" +session.getId());
		         String username=(String)session.getAttribute("username");  
		         out.print("<h1> Welcome" + username + "</h1>");
		         PostgressDBOperations db = new  PostgressDBOperations();
		         try {
		        	 
		        	 ObjectMapper mapperObj = new ObjectMapper();
		        	 Map output;
					try {
						output = db.displayProfile(username);
						System.out.println(output);
						 String jsonString = mapperObj.writeValueAsString(output);
                         System.out.println(jsonString);
                    
                        
		
                       
                       request.setAttribute("data", jsonString);
                     	RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
    					dispatcher.forward(request, response);
//    					out.print(jsonString);
						/* response.getWriter().write(jsonString.toString()); */
                    
					} catch (ClassNotFoundException e) {
						
						e.printStackTrace();
					} catch (SQLException e) {
						
						e.printStackTrace();
					} 
                     
                    
                        

		         }finally

	{
		out.flush();
		out.close();
	}
}

}
}


/*
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * //response.setContentType("text/html"); PrintWriter out =
 * response.getWriter(); System.out.println("inside Dopost"); HttpSession
 * session = request.getSession(false); if (session != null) {
 * System.out.println("Session Id:" + session.getId()); String username =
 * (String) session.getAttribute("username"); out.print("<h1> Welcome" +
 * username + "</h1>"); PostgressDBOperations db = new PostgressDBOperations();
 * 
 * try { Map output = db.displayProfile(username); ObjectMapper mapperObj = new
 * ObjectMapper(); System.out.println(output);
 * 
 * String jsonString = mapperObj.writeValueAsString(output);
 * 
 * response.setContentType("application/json"); // Set content type of the
 * response so that jQuery knows // what it can expect. //
 * response.setCharacterEncoding("UTF-8"); // You want world domination, huh? //
 * response.getWriter().write("RETurn DATA");
 * response.sendRedirect("profile.jsp");
 * response.getWriter().append("Served at: ").append(request.getContextPath());
 * 
 * System.out.println(jsonString); // 
 * request.setAttribute("response",jsonString); // 
 * RequestDispatcher rd=request.getRequestDispatcher("profile.jsp"); // rd.forward(request,
 * response); // response.getWriter().write("RETurn DATA"); //HttpSession
 * session = request.getSession();
 * 
 * session.setAttribute("username","shello" ); String name = (String)
 * session.getAttribute("username"); System.out.println(name);
 * System.out.println("Session Id:" + session.getId());
 * 
 * 
 * RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
 * dispatcher.forward(request, response);
 * 
 * } catch (ClassNotFoundException | SQLException e) { e.printStackTrace(); }
 * 
 * } } }
 * 
 */



//							/*
//							 * request.setAttribute("data", jsonString); RequestDispatcher rd=
//							 * request.getRequestDispatcher("profile.jsp"); rd.forward(request, response);
//							 */
//							/*
//							 * response.setContentType("application/json");
//							 * response.setCharacterEncoding("utf-8"); out.print(jsonString);
//							 */
//							/* response.sendRedirect("profile.jsp"); */
//						
//							/*
//							 * 
//							 * 
//							 */
//							
//                     	
//                         
//                      
//                    


//						/*
//						 * JSONArray jsonArray = new JSONArray(); for (int i=0; i < output.size(); i++)
//						 * { jsonArray.add(output.get(i).getJSONObject());
//						 * 
//						 * System.out.println(jsonArray);
//						 * 
//						 * // String s = jsonArray.toString(); // session.setAttribute("jsonArray", s);
//						 * // var jsonArray= ${jsonArray};
//						 * response.getWriter().print(jsonArray.toJSONString());
//						 * 
//						 * // response.sendRedirect("profile.jsp");
//						 * 
//						 * request.setAttribute("ProfileServlet", jsonArray); //categorylist is an
//						 * arraylist contains object of class category
//						 * getServletConfig().getServletContext().getRequestDispatcher("profile.jsp").
//						 * forward(request,response);
//						 * request.getRequestDispatcher("profile.jsp").forward(request, response);
//						 * 
//						 * 
//						 * 
//						 * 
//						 * }
//						 
//		         }catch (ClassNotFoundException | SQLException e) {
//				e.printStackTrace();
//			}
//		         
//}
//	}
//}*/
