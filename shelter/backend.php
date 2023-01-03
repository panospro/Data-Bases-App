<?php

// Connect to the database
$conn = new mysqli('localhost', 'root', '', 'shelterdb');

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

  // Get the form data
  $lostName = $_POST['lost-name'];
  $lostBreed = $_POST['lost-breed'];
  $lostDescription = $_POST['lost-description'];
  $lostLocation = $_POST['lost-location'];
  $lostPhone = $_POST['lost-phone'];
  $lostEmail = $_POST['lost-email'];
  $lostPhoto = $_POST['lost-photo'];


  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  } else{
    $stmt = $conn->prepare("INSERT INTO lost(`Pet Name`, `Pet Breed`, `Pet Description`, `Last Known Location`, `Phone Number`, Email, Photo) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssiss", $lostName, $lostBreed, $lostDescription, $lostLocation, $lostPhone, $lostEmail, $lostPhoto);
  
    // Validate phone number
    if (strlen($lostPhone) !== 10) {
      die("Phone number must be 10 digits");
    }
  
    // Validate email
    if (!filter_var($lostEmail, FILTER_VALIDATE_EMAIL)) {
      die("Invalid email format");
    }
  
    // Validate photo file type
    $photoFileType = strtolower(pathinfo($lostPhoto, PATHINFO_EXTENSION));
    if ($photoFileType != "jpg" && $photoFileType != "png") {
      die("Only JPG and PNG files are allowed for the photo");
    }
    
    $stmt->execute();
    
    // echo "Contact Records Inserted";
    $stmt->close();
    $conn->close();
    header('Location: http://localhost/shelter/Website.html');  //IT HAS TO BE IN A LOCALHOST
  }

?>