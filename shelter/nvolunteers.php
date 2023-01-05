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
  $phone = $_POST['phone'];
  $availability = $_POST['availability'];
  $experience = $_POST['experience'];
  $interests = $_POST['interests'];


  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  } else{
    $stmt = $conn->prepare("INSERT INTO nvolunteers(`Name`, `Email`, `Phone`, `Availability`, `Experience`, `Skills`) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssisss", $name, $email, $phone, $availability, $experience, $interests);
  
    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      die("Invalid email format");
    }

    // Validate phone number
    if (strlen($phone) !== 10) {
      die("Phone number must be 10 digits");
    }
  

    $stmt->execute();
    
    // echo "Contact Records Inserted";
    $stmt->close();
    $conn->close();
    header('Location: http://localhost/shelter/Website.html');
  }

?>