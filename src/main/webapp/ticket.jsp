<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Event Ticket Registration</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-icons.css" rel="stylesheet" />
    <link href="css/templatemo-festava-live.css" rel="stylesheet" />
    
  </head>
  <body>
		<main>
		      <header class="site-header">
		        <div class="container">
		          <div class="row">
		            <div class="col-lg-12 col-12 d-flex flex-wrap">
		              <p class="d-flex me-4 mb-0">
		                <i class="bi-person custom-icon me-2"></i>
		                <strong class="text-dark"
		                  >Welcome to Event Carnival Live
		                </strong>
		              </p>
		            </div>
		          </div>
		        </div>
		        </header>
		      <nav class="navbar navbar-expand-lg">
		        <div class="container">
		          <a class="navbar-brand" href="index.jsp"> Event Carnival Live </a>
		
		          <a href="ticket.jsp" class="btn custom-btn d-lg-none ms-auto me-4">Buy Ticket</a>
		          <button class="navbar-toggler"
		            type="button"
		            data-bs-toggle="collapse"
		            data-bs-target="#navbarNav"
		            aria-controls="navbarNav"
		            aria-expanded="false"
		            aria-label="Toggle navigation">
		            <span class="navbar-toggler-icon"></span>
		          </button>
		
		          <div class="collapse navbar-collapse" id="navbarNav">
		            <ul class="navbar-nav align-items-lg-center ms-auto me-lg-5">
		              <li class="nav-item">
		                <a class="nav-link click-scroll" href="index.jsp#section_1">Home</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link click-scroll" href="index.jsp#section_2">About</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link click-scroll" href="index.jsp#section_3">Artists</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link click-scroll" href="index.jsp#section_4">Schedule</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link click-scroll" href="index.jsp#section_5">Pricing</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link click-scroll" href="index.jsp#section_6">Contact</a>
		              </li>
		            </ul>
		          </div>
		        </div>
		      </nav>
		
		      <section class="ticket-section section-padding">
		        <div class="section-overlay"></div>
		        <div class="container">
		          <div class="row">
		            <div class="col-lg-6 col-10 mx-auto">
		              <form class="custom-form ticket-form mb-5 mb-lg-0" action="#" method="post" role="form">
					    <h2 class="text-center mb-4">Get started here</h2>
					    <div class="ticket-form-body">
					        <div class="row">
					    <%
							try {
							    // Your database connection code
							    Class.forName("com.mysql.jdbc.Driver");
							    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Event", "root", "Root@123");
							    
							    // Query to fetch event details from the schedule table
							    String query = "SELECT * FROM EventRegistration WHERE Event_Date = ?";
							    PreparedStatement statement = con.prepareStatement(query);
							    
							    statement.setString(1, request.getParameter("Event_Date")); // Replace "id" with your actual parameter name
							    
							    ResultSet resultSet = statement.executeQuery();
							    
							    // Check if the result set has data
							    if (resultSet.next()) {
							        String showName = resultSet.getString("Event_Name");
							        String date = resultSet.getString("Event_Date");
							        String time = resultSet.getString("Event_Timing");
							        String host = resultSet.getString("Event_Host");
							%>
									<div class="col-lg-6 col-md-6 col-12">
									    <input type="text" name="showName" class="form-control" style="color: #367588; font-weight: bold; background-color: #c9c9c9;" value="<%= request.getParameter("Event_Name") %>" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
									    <input type="text" name="date" class="form-control" style="color: #367588; font-weight: bold; background-color: #c9c9c9;" value="<%= request.getParameter("Event_Date") %>" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
									    <input type="text" name="time" class="form-control" style="color: #367588; font-weight: bold; background-color: #c9c9c9;" value="<%= request.getParameter("Event_Timing") %>" readonly>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
									    <input type="text" name="host" class="form-control" style="color: #367588; font-weight: bold; background-color: #c9c9c9;" value="<%= request.getParameter("Event_Host") %>" readonly>
									</div>

					    <%
						    	}
							    // Close resources
							    resultSet.close();
							    statement.close();
							    con.close();
							} catch (SQLException | ClassNotFoundException e) {
							    e.printStackTrace();
							}
						%>
					            <div class="col-lg-6 col-md-6 col-12">
					                <input type="text" name="ticket-form-name" id="ticket-form-name" class="form-control" placeholder="Full name" style="color: black;" required />
					            </div>
					            <div class="col-lg-6 col-md-6 col-12">
					                <input type="email" name="ticket-form-email" id="ticket-form-email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Email address" style="color: black;" />
					            </div>
					        <div class="col-lg-6 col-md-6 col-12">
			                  <input type="tel" class="form-control" name="ticket-form-phone" placeholder="Ph xxx-xxx-x890" pattern="[0-9]{10}" style="color: black;" required />
		                  </div>
		
							<div class="col-lg-6 col-md-6 col-12">
								<input type="number" name="ticket-form-number" id="ticket-form-number" class="form-control" placeholder="Number of Tickets" style="color: black;" required />
							</div>
							
							<div class="col-lg-10 col-md-4 col-8">
								<textarea name="ticket-form-message" rows="3" class="form-control" id="ticket-form-message" placeholder="Additional Request"></textarea>
							</div>
							
						</div>
		                  <div class="col-lg-4 col-md-10 col-8 mx-auto">
		            		<button id="redirectWEB" type="submit" class="form-control">Buy Ticket</button>
		        		</div>
		    		</div>
		    		<%
						try {
						    // Database connection
						    Class.forName("com.mysql.jdbc.Driver");
						    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Event", "root", "Root@123");
						
						    // Prepare the SQL statement to insert into TicketBooking table
						    String insertQuery = "INSERT INTO TicketBooking (Event_Name, Event_Date, Event_Timing, Event_Host, Full_Name, Email_Address, Phone_Number, Number_of_Tickets, Additional_Request) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
						    PreparedStatement insertStatement = con.prepareStatement(insertQuery);
						
						    // Set parameters from the form for TicketBooking table insertion
						    insertStatement.setString(1, request.getParameter("showName"));
						    insertStatement.setString(2, request.getParameter("date"));
						    insertStatement.setString(3, request.getParameter("time"));
						    insertStatement.setString(4, request.getParameter("host"));
						    insertStatement.setString(5, request.getParameter("ticket-form-name"));
						    insertStatement.setString(6, request.getParameter("ticket-form-email"));
						    insertStatement.setString(7, request.getParameter("ticket-form-phone"));
						
						    String ticketFormNumber = request.getParameter("ticket-form-number");
						    int numberOfTickets = 0; // Default value
						    if (ticketFormNumber != null && !ticketFormNumber.isEmpty()) {
						        numberOfTickets = Integer.parseInt(ticketFormNumber);
						    }
						    insertStatement.setInt(8, numberOfTickets);
						
						    insertStatement.setString(9, request.getParameter("ticket-form-message"));
						    int rowsInserted = insertStatement.executeUpdate();
						
						    if (rowsInserted > 0) {
						        String updateQuery = "UPDATE EventRegistration SET TotalTickets = TotalTickets - ? WHERE Event_Name = ? AND Event_Date = ? AND Event_Timing = ? AND Event_Host = ?";
						        PreparedStatement updateStatement = con.prepareStatement(updateQuery);
						        updateStatement.setInt(1, numberOfTickets);
						        updateStatement.setString(2, request.getParameter("showName"));
						        updateStatement.setString(3, request.getParameter("date"));
						        updateStatement.setString(4, request.getParameter("time"));
						        updateStatement.setString(5, request.getParameter("host"));
						        updateStatement.executeUpdate();
						        
						        updateStatement.close();
						
						        out.println("<script>showPopup('Ticket booked successfully!');</script>");
						    } else {
						        out.println("<script>showPopup('Failed to book ticket.');</script>");
						    }
						
						    // Close resources
						    insertStatement.close();
						    con.close();
						} catch (SQLException | ClassNotFoundException e) {
						    e.printStackTrace();
						}
					%>
				</form>
				<!-- Add this HTML code at the bottom of your JSP file, after the form -->
					<div id="popup" class="popup">
					    <div class="popup-content" id="popup-content">
					        <span class="close" onclick="closePopup()">&times;</span>
					        <p id="popup-message"></p>
					    </div>
					</div>
					
					<script>
					    function showPopup(message) {
					        var popup = document.getElementById("popup");
					        var popupMessage = document.getElementById("popup-message");
					        popupMessage.innerHTML = message;
					        popup.style.display = "block";
					    }
					
					    function closePopup() {
					        var popup = document.getElementById("popup");
					        popup.style.display = "none";
					    }
					</script>
            </div>
          </div>
        </div>
      </section>
	</main>

    <footer class="site-footer">
      <div class="site-footer-top">
        <div class="container">
          <div class="row">z
            <div class="col-lg-6 col-12">
              <h2 class="text-white mb-lg-0">Event Carnival Live</h2>
            </div>
            <div
              class="col-lg-6 col-12 d-flex justify-content-lg-end align-items-center">
              <ul class="social-icon d-flex justify-content-lg-end">
                <li class="social-icon-item">
                  <a href="https://twitter.com/?lang=en" class="social-icon-link">
                    <span class="bi-twitter"></span>
                  </a>
                </li>
                <li class="social-icon-item">
                  <a href="https://www.instagram.com/" class="social-icon-link">
                    <span class="bi-instagram"></span>
                  </a>
                </li>
                <li class="social-icon-item">
                  <a href="https://www.youtube.com/" class="social-icon-link">
                    <span class="bi-youtube"></span>
                  </a>
                </li>
                <li class="social-icon-item">
                  <a href="https://www.pinterest.com/" class="social-icon-link">
                    <span class="bi-pinterest"></span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
  
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-12 mb-4 pb-2">
            <h5 class="site-footer-title mb-3">Links</h5>
            <ul class="site-footer-links">
              <li class="site-footer-link-item">
                <a href="index.jsp#section_1" class="site-footer-link">Home</a>
              </li>
              <li class="site-footer-link-item">
                <a href="index.jsp#section_2" class="site-footer-link">About</a>
              </li>
              <li class="site-footer-link-item">
                <a href="index.jsp#section_3" class="site-footer-link">Artists</a>
              </li>
              <li class="site-footer-link-item">
                <a href="index.jsp#section_4" class="site-footer-link">Schedule</a>
              </li>
              <li class="site-footer-link-item">
                <a href="index.jsp#section_5" class="site-footer-link">Sponsor's</a>
              </li>
              <li class="site-footer-link-item">
                <a href="index.jsp#section_6" class="site-footer-link">Contact</a>
              </li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
            <h5 class="site-footer-title mb-3">Have a question?</h5>
            <p class="text-white d-flex mb-1">
              <a href="tel: 7448255689" class="site-footer-link">
                +91 - 7448255689
              </a>
            </p>
            <p class="text-white d-flex mb-1">
              <a href="tel: 9356560211" class="site-footer-link">
                +91 - 9356560211
              </a>
            </p>
            <p class="text-white d-flex mb-1">
              <a href="tel: 7387970984" class="site-footer-link">
                +91 - 7387970984
              </a>
            </p>

            <p class="text-white d-flex">
              <a href="mailto:roshan.khandagale07@gmail.com" class="site-footer-link">
                roshan.khandagale07@gmail.com
              </a>
            </p>
            <p class="text-white d-flex">
              <a href="mailto:gdkayarkar2002@gmail.com" class="site-footer-link">
                gdkayarkar2002@gmail.com
              </a>
            </p>
            <p class="text-white d-flex">
              <a href="mailto:omkarapatankar807@gmail.com" class="site-footer-link">
                omkarapatankar807@gmail.com
              </a>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 col-11 mb-4 mb-lg-0 mb-md-0">
            <h5 class="site-footer-title mb-3">Location</h5>
            <p class="text-white d-flex mt-3 mb-2">
              Near Nandanvan Road, Nagpur, 440024
            </p>
          </div>
        </div>
      </div>

      <div class="site-footer-bottom">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-12 mt-5">
              <p class="copyright-text">Copyright © 2024 Event Carnival Live</p>
              <p class="copyright-text">
                Distributed by:
                <a href="https://www.linkedin.com/in/roshan-khandagale/">ROG PVT. LTD</a>
              </p>
            </div>

            <div class="col-lg-8 col-12 mt-lg-5">
              <ul class="site-footer-links">
                <li class="site-footer-link-item">
                  <a href="#" class="site-footer-link">Terms &amp; Conditions</a>
                </li>
                <li class="site-footer-link-item">
                  <a href="#" class="site-footer-link">Privacy Policy</a>
                </li>
                <li class="site-footer-link-item">
                  <a href="#" class="site-footer-link">Your Feedback</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- JAVASCRIPT FILES -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/custom.js"></script>

    <!-- MEET REDIRECT -->
    <script>
      // Add an event listener to the button
      document
        .getElementById("redirectWEB")
        .addEventListener("click", function () {
          window.location.href = "WEB_UIKITS.jsp";
        });
    </script>
  </body>
</html>
