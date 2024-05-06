<?php
header('Content-Type: text/html; charset=UTF-8');
define("SITEURL", "http://localhost/Passport-Register/");

$serverName = "MARCO-A315";
$databaseName = "Passport";

$connectionInfo = array(
	"Database" => $databaseName,
	"CharacterSet" => "UTF-8"
);

/* Connect using SQL Server Authentication. */
$conn = sqlsrv_connect($serverName, $connectionInfo);

// print_r($stmt);

// $tsql = "SELECT * FROM Form_Register";

// $stmt = sqlsrv_query($conn, $tsql);

// $stmt = sqlsrv_query($conn, 'SELECT * FROM Form_Register');

// if ($stmt) {
// 	echo "Fetched Data<br>\n";
// 	while ($obj = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
// 		echo $obj['hoten'];
// 		echo "\n";
// 	}
// } else {
// 	echo "Error in statement execution.\n";
// 	die(print_r(sqlsrv_errors(), true));
// }
