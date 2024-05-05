<?php include "../components/header_server.php" ?>

<?php
    // session_start();
    $_SESSION["session_variable"] = "Session variable, this is DISPLAY ALL PAGE";
    echo $_SESSION["session_variable"];
?>

<section class="display_info">
    <?php 
        echo '<div class="checker hidden"></div>';
        $target_table_size = ""; // remember to delete this if unecessary


        echo '<div class="same-row">';
        $target_table = "users";
        include "./display/display-data.php";

        $target_table = "wallets";
        include "./display/display-data.php";
        echo '</div>';


        echo '<div class="same-row">';
        $target_table = "wallet_category";
        include "./display/display-data.php";

        $target_table = "categories";
        // $custom_query = "SELECT * FROM wallet_category";
        include "./display/display-data.php";
        echo '</div>';

        echo '<div class="">';
        $target_table = "transactions";
        include "./display/display-data.php";
        echo '</div>';

        $target_table = "users"; // TEMP BECAUSE THIS'LL BE CHANGE LATER
        $custom_table_name = "user and wallet";
        $custom_query = "SELECT 
                            w.walletID,
                            w.name AS wallet_name,
                            w.amount,
                            u.userID,
                            u.name AS user_name
                        FROM 
                            wallets AS w 
                        INNER JOIN 
                            users AS u ON u.userID = w.userID
        ";
        include "./display/display-data.php";
    ?>
</section>
    
<?php include "../components/footer_server.php" ?>