<?php
require_once 'koneksi.php';
require_once 'enkripsi.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = isset($_POST['username']) ? $_POST['username'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $name = isset($_POST['name']) ? $_POST['name'] : '';

    if (empty($name) || empty($username) || empty($password)) {
        $response = array('status' => 'error', 'message' => 'Name, username, and password are required');
        http_response_code(400);
        echo json_encode($response);
        exit();
    }

    $encryptedPassword = encryptPassword($password);

    $sql = "INSERT INTO user (username, password, name) VALUES ('$username', '$encryptedPassword', '$name')";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $response = array('status' => 'success', 'message' => 'User registered successfully');
        http_response_code(200);
        echo json_encode($response);
    } else {
        $response = array('status' => 'error', 'message' => 'Failed to register user');
        http_response_code(500);
        echo json_encode($response);
    }
} else {
    $response = array('status' => 'error', 'message' => 'Invalid request method');
    http_response_code(405);
    echo json_encode($response);
}
?>
