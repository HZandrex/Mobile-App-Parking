<?php
class Fine{
 
    // database connection and table name
    private $conn;
    private $table_name = "fines";
 
    // object properties
    public $id;
    public $lincense_plate;
	public $creator_id;
    public $creator_first_name;
    public $creator_second_name;
	public $fine_type_id;
    public $type;
    public $location;
    public $note;
	public $created_time;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }
	
	// read all fines
	function read(){
	 
		// select all query
		$query = "SELECT
					fine.id, fine.license_plate, fine.creator_id, user_setting.first_name as creator_first_name, user_setting.second_name as creator_second_name, fine.fine_type_id, fine_type.name as type, fine.location, fine.note, fine.created_time
				FROM
					" . $this->table_name . " fine
					LEFT JOIN
						user_settings user_setting
							ON fine.creator_id = user_setting.id
					LEFT JOIN 
						fine_types fine_type 
							ON fine.fine_type_id = fine_type.id";
	 
		// prepare query statement
		$stmt = $this->conn->prepare($query);
	 
		// execute query
		$stmt->execute();
	 
		return $stmt;
	}
	
	// read all fines by date
	function readByDateDesc(){
	 
		// select all query
		$query = "SELECT
					fine.id, fine.license_plate, fine.creator_id, user_setting.first_name as creator_first_name, user_setting.second_name as creator_second_name, fine.fine_type_id, fine_type.name as type, fine.location, fine.note, fine.created_time
				FROM
					" . $this->table_name . " fine
					LEFT JOIN
						user_settings user_setting
							ON fine.creator_id = user_setting.id
					LEFT JOIN 
						fine_types fine_type 
							ON fine.fine_type_id = fine_type.id
                    ORDER by fine.created_time DESC";
	 
		// prepare query statement
		$stmt = $this->conn->prepare($query);
	 
		// execute query
		$stmt->execute();
	 
		return $stmt;
	}
	
	// create fine
	function create(){
	 
		// query to insert record
		$query = "INSERT INTO
					" . $this->table_name . "
				SET
					license_plate=:license_plate, creator_id=:creator_id, fine_type_id=:fine_type_id, location=:location, note=:note";
	 
		// prepare query
		$stmt = $this->conn->prepare($query);
	 
		// sanitize
		$this->license_plate=htmlspecialchars(strip_tags($this->license_plate));
		$this->creator_id=htmlspecialchars(strip_tags($this->creator_id));
		$this->fine_type_id=htmlspecialchars(strip_tags($this->fine_type_id));
		$this->location=htmlspecialchars(strip_tags($this->location));
		$this->note=htmlspecialchars(strip_tags($this->note));
	 
		// bind values
		$stmt->bindParam(":license_plate", $this->license_plate);
		$stmt->bindParam(":creator_id", $this->creator_id);
		$stmt->bindParam(":fine_type_id", $this->fine_type_id);
		$stmt->bindParam(":location", $this->location);
		$stmt->bindParam(":note", $this->note);
	 
		// execute query
		if($stmt->execute()){
			return true;
		}
	 
		return false;
		 
	}
	
	// used when filling up the update fine form
	function readOne(){
	 
		// query to read single record
		$query = "SELECT
					fine.id, fine.license_plate, fine.creator_id, user_setting.first_name as creator_first_name, user_setting.second_name as creator_second_name, fine.fine_type_id, fine_type.name as type, fine.location, fine.note, fine.created_time
				FROM
					" . $this->table_name . " fine
					LEFT JOIN
						user_settings user_setting
							ON fine.creator_id = user_setting.id
					LEFT JOIN 
						fine_types fine_type 
							ON fine.fine_type_id = fine_type.id
				WHERE
					fine.id = ?";
	 
		// prepare query statement
		$stmt = $this->conn->prepare( $query );
	 
		// bind id of fine to be updated
		$stmt->bindParam(1, $this->id);
	 
		// execute query
		$stmt->execute();
	 
		// get retrieved row
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
	 
		// set values to object properties
		$this->license_plate = $row['license_plate'];
		$this->creator_id = $row['creator_id'];
		$this->creator_first_name = $row['creator_first_name'];
		$this->creator_second_name = $row['creator_second_name'];
		$this->fine_type_id = $row['fine_type_id'];
		$this->type = $row['type'];
		$this->location = $row['location'];
		$this->note = $row['note'];
		$this->created_time = $row['created_time'];
	}
	
	// update the fine
	function update(){
	 
		// update query
		$query = "UPDATE
					" . $this->table_name . "
				SET
					license_plate = :license_plate,
					creator_id = :creator_id,
					fine_type_id = :fine_type_id,
					location = :location,
					note = :note
				WHERE
					id = :id";
	 
		// prepare query statement
		$stmt = $this->conn->prepare($query);
	 
		// sanitize
		$this->license_plate=htmlspecialchars(strip_tags($this->license_plate));
		$this->creator_id=htmlspecialchars(strip_tags($this->creator_id));
		$this->fine_type_id=htmlspecialchars(strip_tags($this->fine_type_id));
		$this->location=htmlspecialchars(strip_tags($this->location));
		$this->note=htmlspecialchars(strip_tags($this->note));
		$this->id=htmlspecialchars(strip_tags($this->id));
	 
		// bind new values
		$stmt->bindParam(':license_plate', $this->license_plate);
		$stmt->bindParam(':creator_id', $this->creator_id);
		$stmt->bindParam(':fine_type_id', $this->fine_type_id);
		$stmt->bindParam(':location', $this->location);
		$stmt->bindParam(':note', $this->note);
		$stmt->bindParam(':id', $this->id);
	 
		// execute the query
		if($stmt->execute()){
			return true;
		}
	 
		return false;
	}
	
	// delete the fine
	function delete(){
	 
		// delete query
		$query = "DELETE FROM " . $this->table_name . " WHERE id = ?";
	 
		// prepare query
		$stmt = $this->conn->prepare($query);
	 
		// sanitize
		$this->id=htmlspecialchars(strip_tags($this->id));
	 
		// bind id of record to delete
		$stmt->bindParam(1, $this->id);
	 
		// execute query
		if($stmt->execute()){
			return true;
		}
	 
		return false;
		 
	}
	
	// search fines
	/*function search($keywords){
	 
		// select all query
		$query = "SELECT
					c.name as category_name, p.id, p.name, p.description, p.price, p.category_id, p.created
				FROM
					" . $this->table_name . " p
					LEFT JOIN
						categories c
							ON p.category_id = c.id
				WHERE
					p.name LIKE ? OR p.description LIKE ? OR c.name LIKE ?
				ORDER BY
					p.created DESC";
	 
		// prepare query statement
		$stmt = $this->conn->prepare($query);
	 
		// sanitize
		$keywords=htmlspecialchars(strip_tags($keywords));
		$keywords = "%{$keywords}%";
	 
		// bind
		$stmt->bindParam(1, $keywords);
		$stmt->bindParam(2, $keywords);
		$stmt->bindParam(3, $keywords);
	 
		// execute query
		$stmt->execute();
	 
		return $stmt;
	}
	
	// read fines with pagination
	public function readPaging($from_record_num, $records_per_page){
	 
		// select query
		$query = "SELECT
					c.name as category_name, p.id, p.name, p.description, p.price, p.category_id, p.created
				FROM
					" . $this->table_name . " p
					LEFT JOIN
						categories c
							ON p.category_id = c.id
				ORDER BY p.created DESC
				LIMIT ?, ?";
	 
		// prepare query statement
		$stmt = $this->conn->prepare( $query );
	 
		// bind variable values
		$stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
		$stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);
	 
		// execute query
		$stmt->execute();
	 
		// return values from database
		return $stmt;
	}
	
	// used for paging fines
	public function count(){
		$query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
	 
		$stmt = $this->conn->prepare( $query );
		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
	 
		return $row['total_rows'];
	}*/
}