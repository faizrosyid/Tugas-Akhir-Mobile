<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'news';

$conn = mysqli_init();
if (!mysqli_real_connect($conn, $host, $user, $pass, $dbname)) {
  die("Koneksi gagal: " . mysqli_connect_error());
}

if ($conn->connect_error) {
  die("Koneksi gagal: " . $conn->connect_error);
}