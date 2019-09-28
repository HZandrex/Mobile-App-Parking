<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
 
// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../objects/fine.php';
include_once '../objects/evidence.php';
 
// instantiate database and fine object
$database = new Database();
$db = $database->getConnection();
 
// initialize objects
$fine = new fine($db);
$evidence = new evidence($db);
 
 
// query fines
$result1 = $fine->readByDateDesc();
$num = $result1->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // fines array
    $fines_arr =array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($fine_row = $result1->fetch(PDO::FETCH_ASSOC)){
        // extract fine_row
        // this will make $fine_row['name'] to
        // just $name only
        extract($fine_row);
		
		// set fine_id property of record to read
		$evidence->fine_id = isset($id) ? $id : die();
		
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
 
        $fine_item=array(
            "id" => $id,
            "license_plate" => $license_plate,
            "creator_id" => $creator_id,
            "creator_first_name" => $creator_first_name,
            "creator_second_name" => $creator_second_name,
            "fine_type_id" => $fine_type_id,
            "type" => $type,
            "location" => $location,
			"note" => $note,
			"created_time" => $created_time,
			"evidence_urls" => $evidences_arr
        );
 
        array_push($fines_arr, $fine_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show fines data in json format
    echo json_encode(array_values($fines_arr));
}
 
 
// no fines found will be here
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no fines found
    echo json_encode(
        array("message" => "No fines found.")
    );
}