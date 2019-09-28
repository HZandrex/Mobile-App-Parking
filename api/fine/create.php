<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate fine object
include_once '../objects/fine.php';
include_once '../objects/evidence.php';
 
$database = new Database();
$db = $database->getConnection();
 
$fine = new fine($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->license_plate) &&
    !empty($data->creator_id) &&
    !empty($data->fine_type_id)
){
 
    // set fine property values
    $fine->license_plate = $data->license_plate;
    $fine->creator_id = $data->creator_id;
    $fine->fine_type_id = $data->fine_type_id;
    $fine->location = $data->location;
    $fine->note = $data->note;
 
    // create the fine
    if($fine->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "fine was created."));
    }
 
    // if unable to create the fine, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create fine."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create fine. Data is incomplete."));
}
?>