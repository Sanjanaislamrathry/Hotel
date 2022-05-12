<?php
    $servername="localhost";
    $username="root";
    $password="";
    $dbname="hotel";
    $conn=new mysqli($servername,$username,$password,$dbname);
    if($conn->connect_error)
        die( "Connection failed:".$conn->connect_error);
    else{
        $q="SELECT bid,PhoneNo,L_name,Exdate ,Endate,Hotelname,Rnum FROM customer,books where customer.cid=books.cid";
        $output = '<table border="1">
        <tr>
            <th>Name</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Hotel Name</th>
            <th>Room</th>
            <th>Contact</th>
            <th>Action</th>
        </tr>';
        $result=$conn->query($q);
        if($result->num_rows>0)
        {
        while ($row = $result->fetch_assoc()) 
        {
        $output .= '<tr>
          <td><mark>'.$row["L_name"].'</mark></td>
          <td>'.$row["Endate"].'</td>
          <td>'.$row["Exdate"].'</td>
          <td><i><b>'.$row["Hotelname"].'</b></i></td>
          <td>'.$row["Rnum"].'</td>
          <td>'.$row["PhoneNo"].'</td>
          <td><a href="delete.php?bid='.$row['bid'].'">Delete</a></td>
        </tr>';
        }
        }
        else
            echo "No DATA";
    }
     $output .= '</table>';
     echo $output;  

?>
