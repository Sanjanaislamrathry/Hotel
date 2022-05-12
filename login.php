<?php
if(isset($_POST["btnlogin"]))
{
    $servername="localhost";
    $username="root";
    $password="";
    $dbname="hotel";
    $uname=$_POST["uname"];
    $userpass=$_POST["pass"];
    $conn=new mysqli($servername,$username,$password,$dbname); 
    if($conn->connect_error)
        die( "Connection failed:".$conn->connect_error);
    else{
        $q="select Name,Pass from employee where Name='".$uname."' and pass='".$userpass."'";
        $result=$conn->query($q);
        if($result->num_rows>0)
        {
            header("location: bookings.php");
        }
        else
            echo "<mark>Invalid username or password</mark>";
    }
}
?>
<html>
<body>
    <style>
        button {
  background-color: #04AA6B;
  color: white;
  padding: 10px 12px;
  border-radius: 5px;
  width: 10%;
}
    </style>
    <h1>Login</h1>
    <form action="#" method="post">
        Name:<input type="text" name="uname"><br><br>
        Password:<input type="password" name="pass"><br>
        <br>
    <button type="submit" name="btnlogin"> Login</button>
    
    </form>
</body>
</html>