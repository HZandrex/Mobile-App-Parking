<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
 
// database connection will be here
// include database and object files
include_once '../config/database.php';
include_once '../objects/user_settings.php';
 
// instantiate database and user_settings object
$database = new Database();
$db = $database->getConnection();
 
// initialize objects
$user_settings = new user_settings($db);
 
 
// query user_settings
$result1 = $user_settings->read();
$num = $result1->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // user_settings array
    $user_settings_arr =array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($user_settings_row = $result1->fetch(PDO::FETCH_ASSOC)){
        // extract user_settings_row
        // this will make $user_settings_row['name'] to
        // just $name only
        extract($user_settings_row);
 
        $user_settings_item=array(
            "id" => $id,
            "first_name" => $first_name,
            "second_name" => $second_name
        );
 
        array_push($user_settings_arr, $user_settings_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show user_settingss data in json format
    echo json_encode($user_settings_arr);
}
 
 
// no user_settingss found will be here
else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no user_settingss found
    echo json_encode(
        array("message" => "No user_settings found.")
    );
}