<?php

require_once 'koneksi.php';

function login($conn, $username, $password)
{
    $query = "SELECT id, username, name, password FROM user WHERE username = ?";

    $stmt = mysqli_prepare($conn, $query);
    if (!$stmt) {
        die(mysqli_error($conn));
    }

    mysqli_stmt_bind_param($stmt, "s", $username);

    if (!mysqli_stmt_execute($stmt)) {
        die(mysqli_error($conn));
    }

    mysqli_stmt_bind_result($stmt, $id,  $username, $name, $storedPassword);

    if (mysqli_stmt_fetch($stmt)) {

        if (password_verify($password, $storedPassword)) {
            $response = array(
                "status" => 200,
                "username" => $username,
                "id" => $id,
                "name" => $name
            );
            sendResponse(200, $response);
        } else {
            sendResponse(401, array("message" => "Username atau password salah!"));
        }
    } else {
        sendResponse(401, array("message" => "Username atau password salah!"));
    }

    mysqli_stmt_close($stmt);
    mysqli_close($conn);
}

function sendResponse($statusCode, $data)
{
    http_response_code($statusCode);
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    echo json_encode($data);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
    login($conn, $username, $password);
} else {
    sendResponse(400, array("message" => "Bad Request"));
}

?>
