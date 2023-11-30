<?php

function encryptPassword($password)
{
    $encryptedPassword = password_hash($password, PASSWORD_DEFAULT);
    return $encryptedPassword;
}
