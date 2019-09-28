<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object file
include_once '../config/database.php';
include_once '../objects/user_settings.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare user_settings object
$user_settings = new user_settings($db);
 
// get user_settings id
$data = json_decode(file_get_contents("php://input"));
 
// set user_settings id to be deleted
$user_settings->id = $data->id;
 
// delete the user_settings
if($user_settings->delete()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "user_settings was deleted."));
}
 
// if unable to delete the user_settings
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to delete user_settings."));
}
?>