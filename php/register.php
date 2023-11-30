<?php
// Include the necessary files and initialize the database connection
require_once 'koneksi.php';
require_once 'enkripsi.php';

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the form data
    $username = isset($_POST['username']) ? $_POST['username'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $name = isset($_POST['name']) ? $_POST['name'] : '';

    // Validate input fields
    if (empty($name) || empty($username) || empty($password)) {
        // If any of the required fields is empty, send an error response
        $response = array('status' => 'error', 'message' => 'Name, username, and password are required');
        http_response_code(400); // Bad Request
        echo json_encode($response);
        exit(); // Stop further execution
    }

    // Encrypt the password
    $encryptedPassword = encryptPassword($password);

    // Insert the user data into the database
    $sql = "INSERT INTO user (username, password, name) VALUES ('$username', '$encryptedPassword', '$name')";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        // Registration successful
        $response = array('status' => 'success', 'message' => 'User registered successfully');
        http_response_code(200); // OK
        echo json_encode($response);
    } else {
        // Registration failed
        $response = array('status' => 'error', 'message' => 'Failed to register user');
        http_response_code(500); // Internal Server Error
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response = array('status' => 'error', 'message' => 'Invalid request method');
    http_response_code(405); // Method Not Allowed
    echo json_encode($response);
}
?>
