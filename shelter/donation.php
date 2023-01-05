<?php

// Connect to the database
$conn = new mysqli('localhost', 'root', '', 'shelterdb');

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

  // Get the form data
  $name = $_POST['name'];
  $email = $_POST['email'];
  $amount = $_POST['amount'];
  $options = $_POST['payment-method'];



  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  } else{
    $stmt = $conn->prepare("INSERT INTO donation(`Name`, `Email`, `Donation Amount`, `Method`) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssis", $name, $email, $amount, $options);
  
    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      die("Invalid email format");
    }

    $stmt->execute();
    
    // echo "Contact Records Inserted";
    $stmt->close();
    $conn->close();
    header('Location: http://localhost/shelter/Website.html');
  }

?>