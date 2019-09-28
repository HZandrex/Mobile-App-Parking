<?php
class Evidence{
 
    // database connection and table name
    private $conn;
    private $table_name = "evidences";
 
    // object properties
    public $id;
	public $fine_id;
    public $url;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }
	
	// read evidence
	/*function read(){
	 
		// select all query
		$query = "SELECT * FROM " . $this->table_name;
	 
		// prepare query statement
		$stmt = $this->conn->prepare($query);
	 
		// execute query
		$stmt->execute();
	 
		return $stmt;
	}*/
	
	function readWhereFineId(){
	 
		// select all query
		$query = "SELECT * FROM " . $this->table_name ." WHERE fine_id = ?";
	 
		// prepare query statement
		$stmt = $this->conn->prepare($query);
		
		// bind id of product to be updated
		$stmt->bindParam(1, $this->fine_id);
	 
		// execute query
		$stmt->execute();
	 
		return $stmt;
	}
	
	// delete the fine
	function delete(){
	 
		// delete query
		$query = "DELETE FROM " . $this->table_name . " WHERE fine_id = ?";
	 
		// prepare query
		$stmt = $this->conn->prepare($query);
	 
		// sanitize
		$this->fine_id=htmlspecialchars(strip_tags($this->fine_id));
	 
		// bind id of record to delete
		$stmt->bindParam(1, $this->fine_id);
	 
		// execute query
		if($stmt->execute()){
			return true;
		}
	 
		return false;
		 
	}
}