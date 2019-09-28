<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/fine.php';
include_once '../objects/evidence.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare fine objects
$fine = new fine($db);
$evidence = new evidence($db);
 
// set property of records to read
$fine->id = isset($_GET['id']) ? $_GET['id'] : die();
$evidence->fine_id = isset($_GET['id']) ? $_GET['id'] : die();
 
// read the details of fine to be edited
$fine->readOne();

// query evidence
$result2 = $evidence->readWhereFineId();

$evidences_arr = array();
		
while ($evidence_row = $result2->fetch(PDO::FETCH_ASSOC)){
	$evidence_item = array(
		"id" => $evidence_row['id'],
		"url" => $evidence_row['url']
	);
	array_push($evidences_arr, $evidence_item);
}
 
if($fine->license_plate!=null){
    // create array
    $fine_arr = array(
		"id" => $id,
		"license_plate" => $fine->license_plate,
		"creator_id" => $fine->creator_id,
		"creator_first_name" => $fine->creator_first_name,
		"creator_second_name" => $fine->creator_second_name,
		"fine_type_id" => $fine->fine_type_id,
		"type" => $fine->type,
		"location" => $fine->location,
		"note" => $fine->note,
		"created_time" => $fine->created_time,
		"evidence_urls" => $evidences_arr
    );
 
    // set response code - 200 OK
    http_response_code(200);
 
    // make it json format
    echo json_encode($fine_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user fine does not exist
    echo json_encode(array("message" => "fine does not exist."));
}
?>