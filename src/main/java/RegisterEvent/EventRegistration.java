package RegisterEvent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig(maxFileSize = 16177215)
public class EventRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EventRegistration() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String ShowDate = request.getParameter("ticket-show-date");
		String Name = request.getParameter("ticket-show-name");
		String Timing = request.getParameter("ticket-timing");
		String Author = request.getParameter("ticket-author");
		String TotalTicket = request.getParameter("total-ticket");
		String TicketPrice = request.getParameter("ticket-price");
		Part imagePart = request.getPart("ticket-image");
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead;
		try (InputStream inputStream = imagePart.getInputStream()) {
		    while ((bytesRead = inputStream.read(buffer)) != -1) {
		        byteArrayOutputStream.write(buffer, 0, bytesRead);
		    }
		} catch (IOException e) {
		    e.printStackTrace();
		}
		byte[] imageData = byteArrayOutputStream.toByteArray();

		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Event", "root", "Root@123");
		    PreparedStatement pst = con.prepareStatement("Insert into EventRegistration(Event_Date, Event_Name, Event_Timing, Event_Host, TotalTickets, TicketPrice, Event_Image) values(?,?,?,?,?,?,?)");
		    pst.setString(1, ShowDate);
            pst.setString(2, Name);
            pst.setString(3, Timing);
            pst.setString(4, Author);
            pst.setString(5, TotalTicket);
            pst.setString(6, TicketPrice);
            pst.setBytes(7, imageData);
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
