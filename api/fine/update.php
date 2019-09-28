<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/fine.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare fine object
$fine = new fine($db);
 
// get id of fine to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of fine to be edited
$fine->id = $data->id;
 
// set fine property values
$fine->license_plate = $data->license_plate;
$fine->creator_id = $data->creator_id;
$fine->fine_type_id = $data->fine_type_id;
$fine->location = $data->location;
$fine->note = $data->note;
 
// update the fine
if($fine->update()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "fine was updated."));
}
 
// if unable to update the fine, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update fine."));
}
?>