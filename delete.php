<?php
    $servername="localhost";
    $username="root";
    $password="";
    $dbname="hotel";
    $conn=new mysqli($servername,$username,$password,$dbname);
    $id = $_GET['bid'];
    if($conn->connect_error)
        die( "Connection failed:".$conn->connect_error);
    else{
        $q="DELETE FROM books WHERE bid ='".$id."'";
        //$result=;
        if($conn->query($q))
		{
			echo '<small>Successful</small>';
			header("Location: bookings.php");
		}
		else
		{
			echo '<small>Failed</small>';
		}

        }
		exit();

?>
