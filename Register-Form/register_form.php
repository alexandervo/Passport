<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="#">
    <title>Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="./styles/index.css">
</head>

<body style="padding-top: 0">
    <?php include ".connection.php" ?>

    <?php
    $hoten_Data = $diachi_Data = $gioitinh_Data = $ngaysinh_Data = $so_cccd_Data = $sdt_Data = $email_Data = ""; //Clear data
    $hoten_Data_Err_Msg = $diachi_Data_Err_Msg = $gioitinh_Data_Err_Msg = $ngaysinh_Data_Err_Msg = $so_cccd_Data_Err_Msg = $sdt_Data_Err_Msg = $email_Data_Err_Msg = ""; //Clear ErrMsg

    if (isset($_POST["registered"])) {
        if (empty($_POST["hoten_user_data"])) {
            $hoten_Data_Err_Msg = "<p class='warning'>*Xin vui lòng điền hoten*</p>";
            echo "FUCKING EMPTY";
        } else {
            $hoten_Data = filter_input(INPUT_POST, "hoten_user_data", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $hoten_Data = $_POST["hoten_user_data"];
        }
        if (empty($_POST["diachi_user_data"])) {
            $diachi_Data_Err_Msg = "<p class='warning'>*Xin vui lòng điền diachi*</p>";
        } else {
            $diachi_Data = filter_input(INPUT_POST, "diachi_user_data", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $diachi_Data = $_POST["diachi_user_data"];
        }
        // if (empty($_POST["gioitinh_user_data"])) {
        //     $gioitinh_Data_Err_Msg = "<p class='warning'>*Xin vui lòng điền gioitinh*</p>";
        // } else {
        //     $gioitinh_Data = $_POST["gioitinh_user_data"];
        // }
        if (empty($_POST["ngaysinh_user_data"])) {
            $ngaysinh_Data_Err_Msg = "<p class='warning'>*Xin vui lòng điền ngaysinh*</p>";
        } else {
            $ngaysinh_Data = filter_input(INPUT_POST, "ngaysinh_user_data", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        }
        if (empty($_POST["so_cccd_user_data"])) {
            $so_cccd_Data_Err_Msg = "<p class='warning'>*Xin vui lòng điền so_cccd*</p>";
        } else {
            $so_cccd_Data = filter_input(INPUT_POST, "so_cccd_user_data", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        }
        if (empty($_POST["sdt_user_data"])) {
            $sdt_Data_Err_Msg = "<p class='warning'>*Xin vui lòng điền sdt*</p>";
        } else {
            $sdt_Data = filter_input(INPUT_POST, "sdt_user_data", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        }
        if (empty($_POST["email_user_data"])) {
            $email_Data_Err_Msg = "<p class='warning'>*Xin vui lòng điền email*</p>";
        } else {
            $email_Data = filter_input(INPUT_POST, "email_user_data", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $email_Data = $_POST["email_user_data"];
        }
        $gioitinh_Data = $_POST["gioitinh_user_data"];
    }

    if (
        empty($hoten_Data_Err_Msg) &&
        empty($diachi_Data_Err_Msg) &&
        empty($gioitinh_Data_Err_Msg) &&
        empty($ngaysinh_Data_Err_Msg) &&
        empty($so_cccd_Data_Err_Msg) &&
        empty($sdt_Data_Err_Msg) &&
        empty($email_Data_Err_Msg)
    ) {
        $tsql = "INSERT INTO Form_Register VALUES
            (0, 0, 0, N'" . $hoten_Data . "', N'" . $diachi_Data . "', 0, '" . $ngaysinh_Data . "', '" . $so_cccd_Data . "', '" . $sdt_Data . "', N'" . $email_Data . "')";

        // echo "SQL SCRIPT: " . $tsql;

        $stmt = sqlsrv_query($conn, $tsql);

        if ($stmt) {
            echo "DATA SUBMITED<br>\n";
            // while ($obj = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
            //     echo $obj['hoten'];
            //     echo "\n";
            // }
        } else {
            echo "Error in statement execution.\n";
            die(print_r(sqlsrv_errors(), true));
        }

        // $tsql = "INSERT INTO Resident_data VALUES("
        // . $so_cccd_Data .
        // ", N'" . $hoten_Data . "', "
        // . $ngaysinh_Data .
        // // Login tách quê quán và quốc tịch sẽ được xử lí sau
        // "', N'" . $diachi_Data . "', 0, '" . $ngaysinh_Data . "', '" .  . "', '" . $sdt_Data . "', '" . $email_Data . "')";



        // // echo "SQL SCRIPT: " . $tsql;

        // $stmt = sqlsrv_query($conn, $tsql);
    }
    ?>

    <div class="form-container">
        <div class="title">Thông tin đăng ký</div>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <?php echo $hoten_Data_Err_Msg . "\n" ?>
            <label>
                Họ tên:
                <input type="text" name="hoten_user_data">
            </label>

            <?php echo $diachi_Data_Err_Msg . "\n" ?>
            <label>
                Địa chỉ:
                <input type="text" name="diachi_user_data">
            </label>

            <?php echo $gioitinh_Data_Err_Msg . "\n" ?>
            <label class="sex">
                Giới tính:
                <div class="sex-selection">
                    <label>
                        <input type='radio' name='gioitinh_user_data' value='0'>
                        Nam
                    </label>
                    <label>
                        <input type='radio' name='gioitinh_user_data' value='1' checked>
                        Nữ
                    </label>
                </div>
            </label>

            <?php echo $ngaysinh_Data_Err_Msg . "\n" ?>
            <label>
                Ngày sinh:
                <input type='date' name='ngaysinh_user_data'>
            </label>

            <?php echo $so_cccd_Data_Err_Msg . "\n" ?>
            <label>
                Số CCCD:
                <input type="text" name="so_cccd_user_data">
            </label>

            <?php echo $sdt_Data_Err_Msg . "\n" ?>
            <label>
                Số điện thoại:
                <input type="text" name="sdt_user_data">
            </label>

            <?php echo $email_Data_Err_Msg . "\n" ?>
            <label>
                Email:
                <input type="text" name="email_user_data">
            </label>

            <input class="register-btn option-select" type="submit" value="Đăng ký" name="registered">
        </form>
    </div>
</body>

</html>

<!-- shs NUMERIC IDENTITY, -- Tăng dần khi được tạo mới
trangthai BIT,
xacthuc BIT,
trave BIT,
hoten NVARCHAR(50) NOT NULL,
diachi NVARCHAR(100) NOT NULL,
gioitinh BIT NOT NULL,
ngaysinh DATE NOT NULL,
so_cccd VARCHAR(12) NOT NULL,
sdt VARCHAR(10) NOT NULL,
email NVARCHAR(100), -->