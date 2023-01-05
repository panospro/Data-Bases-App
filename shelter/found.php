<?php

// Connect to the database
$conn = new mysqli('localhost', 'root', '', 'shelterdb');

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

  // Get the form data
  $foundName = $_POST['found-name'];
  $foundBreed = $_POST['found-breed'];
  $foundDescription = $_POST['found-description'];
  $foundLocation = $_POST['found-location'];
  $foundPhone = $_POST['found-phone'];
  $foundEmail = $_POST['found-email'];
  $foundPhoto = $_POST['found-photo'];


  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  } else{
    $stmt = $conn->prepare("INSERT INTO found(`Pet Name`, `Pet Breed`, `Pet Description`, `Location Found`, `Phone Number`, Email, Photo) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssiss", $foundName, $foundBreed, $foundDescription, $foundLocation, $foundPhone, $foundEmail, $foundPhoto);
  
    // Validate phone number
    if (strlen($foundPhone) !== 10) {
      die("Phone number must be 10 digits");
    }
  
    // Validate email
    if (!filter_var($foundEmail, FILTER_VALIDATE_EMAIL)) {
      die("Invalid email format");
    }
  
    // Validate photo file type
    $photoFileType = strtolower(pathinfo($foundPhoto, PATHINFO_EXTENSION));
    if ($photoFileType != "jpg" && $photoFileType != "png") {
      die("Only JPG and PNG files are allowed for the photo");
    }
    
    // Check if phone number is already registered
    $phoneExists = $conn->query("SELECT * FROM lost WHERE `Phone Number` = '$lostPhone' LIMIT 1");
    if ($phoneExists->num_rows > 0) {
      die("Phone number is already registered! If you lost the same pet or another pet you can contact us directly, because you are already registered!");
    }

    $stmt->execute();

    // echo "Contact Records Inserted";
    $stmt->close();
    $conn->close();
    header('Location: http://localhost/shelter/Website.html');
  }

?>