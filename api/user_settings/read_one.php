<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/user_settings.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare user_setting objects
$user_settings = new user_settings($db);
 
// set property of records to read
$user_settings->id = isset($_GET['id']) ? $_GET['id'] : die();
 
// read the details of user_setting to be edited
$user_settings->readOne();
 
if($user_settings->first_name!=null && $user_settings->second_name!=null){
    // create array
    $user_settings_arr = array(
		"id" => $user_settings->id,
		"first_name" => $user_settings->first_name,
		"second_name" => $user_settings->second_name
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format
    echo json_encode($user_settings_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user user_setting does not exist
    echo json_encode(array("message" => "user_settings does not exist."));
}
?>