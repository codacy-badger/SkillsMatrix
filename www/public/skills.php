<?php include("session.php");?>

<?php
 

    if(isset($_POST['skill'])){
        require_once '../private/db.inc.php';
        mysqli_select_db($link,'skillsmatrix');

        $sql = "INSERT INTO skill (description) VALUES (UPPER('$_POST[skill]'))";

        if(mysqli_query($link, $sql)){
//            echo "Records added successfully.";
        } else{
//            echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
        }

      // close connection
      mysqli_close($link);
      header("location: skills.php");
      exit;
      }

    if(isset($_GET['id'])){
      require_once '../private/db.inc.php';
      mysqli_select_db($link,'skillsmatrix');

      $sql = "DELETE FROM skill WHERE id = ('$_GET[id]')";

      if(mysqli_query($link, $sql)){
//          echo "Records added successfully.";
      } else{
//          echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
      }

    // close connection
    mysqli_close($link);
    header("location: skills.php");
    exit;
    }
?>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Skills Matrix</title>
        <?php
                include("header.html");

                require_once '../private/db.inc.php';

                $sql = 'SELECT * FROM skill';
                mysqli_select_db($link,'skillsmatrix');
                $retval = mysqli_query( $link, $sql);

                if(! $retval ) {
                    die('Could not get data: ' . mysql_error());
                }
                echo "<table id='table' class='table table-striped table-bordered' align='center' data-sorting='true' style='max-width: 70%;text-align:left'>
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Description</th>
                                                    <th>Created At</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>"; while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)) { echo "
                                                <tr>
                                                    <td>".$row["id"]."</td>
                                                    <td>".$row["description"]."</td>
                                                    <td>".$row["created_at"]."</td>
                                                    <td>
                                                        <button class='btn btn-warning'><a href='skills.php?id=".$row[' id ']."' onClick='return confirm(\"This action is irreversible, are you sure?\");'>Delete</a></button>
                                                    </td>
                                                </tr>"; } echo "</tbody>
                                            </table>"; mysqli_close($link); ?>

            <form class="form-inline justify-content-center" action="skills.php" method="post">
                <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" name="skill" id="inlineFormInput" placeholder="ie. VLAN">
                <button type="submit" class="btn btn-primary">Add</button>

            </form>

            </div>
            </div>
            <script>
                $(document).ready(function() {
                    $('#table').DataTable({
                        "order": [
                            [0, "desc"]
                        ]
                    });
                });
            </script>
            </body>

    </html>