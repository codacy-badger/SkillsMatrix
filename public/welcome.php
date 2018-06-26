<?php
// Initialize the session
session_start();

// If session variable is not set it will redirect to login page
if(!isset($_SESSION['username']) || empty($_SESSION['username'])){
  header("location: login.php");
  exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Skills Matrix</title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <style type="text/css">
        body{ font: 14px sans-serif; text-align: center; }
    </style>
</head>
<body>
    <div class="page-header">
        <p></p>
        <h1>Hi, <b><?php echo htmlspecialchars($_SESSION['username']); ?></b>. Welcome to Skills Matrix.</h1>
    </div>
    <p><a href="all_skills.php" class="btn btn-success">All Skills</a> <a href="my_skills.php" class="btn btn-danger">My Skills</a> <a href="logout.php" class="btn btn-warning">Sign Out of Your Account</a></p>

<?php
require_once '../private/config.php';

   $sql = 'SELECT * FROM users';
   mysqli_select_db($link,'skillsmatrix');
   $retval = mysqli_query( $link, $sql);

   if(! $retval ) {
      die('Could not get data: ' . mysql_error());
   }
 echo "<table align='center' class='table table-striped' style='max-width: 70%;text-align:left' ><thead><tr><th>ID</th><th>Username</th><th>Password</th></tr></thead><tbody>";
   while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)) {
echo "<tr><td>".$row["id"]."</td><td>".$row["username"]."</td><td>".$row["password"]."</td></tr>";
   }
        echo "</tbody></table>";

   mysqli_close($link);
?>

</body>

</html>