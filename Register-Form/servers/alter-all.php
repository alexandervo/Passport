<?php include "../components/header_server.php" ?>

<?php
	$field_query = "SELECT * FROM categories";
	$field_query_result = mysqli_query($connection, $field_query);
	$field_list = mysqli_fetch_all($field_query_result, MYSQLI_ASSOC);
?>

<?php include "./alter/alter-transaction.php"; ?>
<?php include "./alter/alter-category.php"; ?>
<?php include "./alter/alter-wallet.php"; ?>
<?php include "./alter/alter-user.php"; ?>
<?php include "./alter/alter-wallet_category.php"; ?>
	
<?php include "../components/footer_server.php" ?>