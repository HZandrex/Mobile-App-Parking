<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
 
// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../objects/evidence.php';
 
// instantiate database and evidence object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$evidence = new evidence($db);
 
 
// read evidences will be here
// query evidences
$stmt = $evidence->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // evidences array
    $evidences_arr=array();
    $evidences_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $evidence_item=array(
            "id" => $id,
			"fine_id" => $fine_id,
            "url" => $url
        );
 
        array_push($evidences_arr["records"], $evidence_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show evidences data in json format
    echo json_encode($evidences_arr);
}
 
 
// no evidences found will be here
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no evidences found
    echo json_encode(
        array("message" => "No evidences found.")
    );
}