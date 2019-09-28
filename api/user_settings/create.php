<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate user_settings object
include_once '../objects/user_settings.php';
 
$database = new Database();
$db = $database->getConnection();
 
$user_settings = new user_settings($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->first_name) &&
    !empty($data->second_name)
){
 
    // set user_settings property values
    $user_settings->first_name = $data->first_name;
    $user_settings->second_name = $data->second_name;
 
    // create the user_settings
    if($user_settings->create()){
		$user_settings->id = $db->lastInsertId();
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode($user_settings);
    }
 
    // if unable to create the user_settings, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create user_settings."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create user_settings. Data is incomplete."));
}
?>