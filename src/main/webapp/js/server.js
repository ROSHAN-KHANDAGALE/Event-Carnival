const express = require("express");
const mysql = require("mysql");

const app = express();

// Create connection to MySQL database
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Root@123",
  database: "event_carnival",
});

// Connect to MySQL
db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log("Connected to MySQL database");
});

// Route to fetch schedule data from the database
app.get("/schedule", (req, res) => {
  const sql = "SELECT * FROM schedule_table";
  db.query(sql, (err, results) => {
    if (err) {
      throw err;
    }
    res.json(results);
  });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
