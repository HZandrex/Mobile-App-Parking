<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/user_settings.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare user_settings object
$user_settings = new user_settings($db);
 
// get id of user_settings to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of user_settings to be edited
$user_settings->id = $data->id;
 
// set user_settings property values
$user_settings->first_name = $data->first_name;
$user_settings->second_name = $data->second_name;
 
// update the user_settings
if($user_settings->update()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "user_settings was updated."));
}
 
// if unable to update the user_settings, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update user_settings."));
}
?>