package RegisterEvent;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EventRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EventRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String Name = request.getParameter("ticket-show-name");
		String Timing = request.getParameter("ticket-timing");
		String Author = request.getParameter("ticket-author");
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Event", "root", "Root@123");

		    PreparedStatement pst = con.prepareStatement("Insert into EventRegistration(ShowName, Timing, Author) values(?,?,?)");
		    pst.setString(1, Name);
		    pst.setString(2, Timing);
		    pst.setString(3, Author);

		    int rowsAffected = pst.executeUpdate();
		    if (rowsAffected > 0) {
		        response.sendRedirect("index.jsp");
		    } else {
		        out.println("<h2>Error Try Again</h2>");
		    }

		    pst.close();
		    con.close();
		} catch(SQLException | ClassNotFoundException e) {
		    out.println("Message : " + e);
		}

		}
	}

