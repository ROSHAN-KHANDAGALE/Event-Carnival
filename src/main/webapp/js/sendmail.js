(function () {
  emailjs.init("joIOHEVCq1Bk6YBHV");
  document
    .getElementById("contact-form")
    .addEventListener("submit", function (event) {
      event.preventDefault();

      // Fetch the user's email and message
      const userName = document.getElementById("contact-name").value;
      const userEmail = document.getElementById("contact-email").value;
      const userCompany = document.getElementById("contact-company").value;
      const userMessage = document.getElementById("contact-message").value;

      // Generate Meet link
      const roomID = getUrlParams(window.location.href)['roomID'] || (Math.floor(Math.random() * 10000) + "");
      const role = 'Audience'; // Set role as Audience for email recipients
      const meetLink = generateMeetLink(roomID, role);

      // Send email using EmailJS
      emailjs
        .send("service_kifkfrc", "template_g6lgv8e", {
          from_name: userName,
          from_email: userEmail,
          from_company: userCompany,
          message: userMessage,
          meet_link: meetLink, // Pass Meet link as a parameter
        })
        .then(
          function (response) {
            console.log("Email sent:", response);
            showSuccessToast("Email sent successfully!");
            // Reset form fields after successful submission
            document.getElementById("contact-form").reset();
          },
          function (error) {
            console.error("Email sending failed:", error);
            showErrorToast("Failed to send email. Please try again later.");
          }
        );
    });

  // Function to generate Meet link
  function generateMeetLink(roomID, role) {
    return window.location.protocol + '//' +
      window.location.host +
      window.location.pathname +
      '?roomID=' +
      roomID +
      '&role=' +
      role;
  }

  // Function to show success toast
  function showSuccessToast(message) {
    const toast = document.getElementById("success-toast");
    toast.textContent = message;
    toast.classList.add("show");
    setTimeout(function () {
      toast.classList.remove("show");
    }, 3000); // Hide after 3 seconds
  }

  // Function to show error toast
  function showErrorToast(message) {
    const toast = document.getElementById("error-toast");
    toast.textContent = message;
    toast.classList.add("show");
    setTimeout(function () {
      toast.classList.remove("show");
    }, 3000); // Hide after 3 seconds
  }
})();
