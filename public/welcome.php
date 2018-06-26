<?php
// Initialize the session
session_start();

// If session variable is not set it will redirect to login page
if(!isset($_SESSION['username']) || empty($_SESSION['username'])){
  header("location: index.php");
  exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Skills Matrix</title></title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    <style type="text/css">
        body{ font: 14px sans-serif; text-align: center; }
    </style>
 </head>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Reports
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">By Person</a>
          <a class="dropdown-item" href="#">By Skill</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">General</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Admin</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <p>Welcome back <?php echo htmlspecialchars($_SESSION['username']); ?></p>
      <a href="logout.php" class="btn btn-warning">Sign out</a>
    </form>
  </div>
</nav>

<body>
    <div class="page-header">
        <p></p>
    </div>
    <p><a href="all_skills.php" class="btn btn-success">All Skills</a> <a href="my_skills.php" class="btn btn-danger">My Skills</a> <a href="logout.php" class="btn btn-warning">Sign Out</a></p>

<?php
require_once '../private/db.inc.php';

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