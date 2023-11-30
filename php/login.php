<?php

require_once 'koneksi.php';

// Function to handle login
function login($conn, $username, $password)
{
    // Fetch the stored password from the database based on the provided username
    $query = "SELECT id, username, name, password FROM user WHERE username = ?";

    $stmt = mysqli_prepare($conn, $query);
    if (!$stmt) {
        die(mysqli_error($conn));
    }

    mysqli_stmt_bind_param($stmt, "s", $username);

    if (!mysqli_stmt_execute($stmt)) {
        die(mysqli_error($conn));
    }

    // Bind the result variables
    mysqli_stmt_bind_result($stmt, $id,  $username, $name, $storedPassword);

    // Fetch the results
    if (mysqli_stmt_fetch($stmt)) {

        // Verify the entered password against the stored, encrypted password
        if (password_verify($password, $storedPassword)) {
            // Password is correct
            $response = array(
                "status" => 200,
                "username" => $username,
                "id" => $id,
                "name" => $name
            );
            sendResponse(200, $response);
        } else {
            // Password is incorrect
            sendResponse(401, array("message" => "Username atau password salah!"));
        }
    } else {
        // No data fetched or username not found
        sendResponse(401, array("message" => "Username atau password salah!"));
    }

    // Close the statement
    mysqli_stmt_close($stmt);
    mysqli_close($conn);
}

// Function to send HTTP response with proper headers
function sendResponse($statusCode, $data)
{
    http_response_code($statusCode);
    header('Content-Type: application/json');
    // Add the Access-Control-Allow-Origin header to allow cross-origin requests
    header('Access-Control-Allow-Origin: *');
    echo json_encode($data);
    exit;
}

// Example usage
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
    login($conn, $username, $password);
} else {
    // Invalid request method
    sendResponse(400, array("message" => "Bad Request"));
}

?>
