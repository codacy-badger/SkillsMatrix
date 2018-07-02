<?php include("session.php");?>

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

                    $sql = 'SELECT * FROM person';
                    mysqli_select_db($link,'skillsmatrix');
                    $retval = mysqli_query( $link, $sql);

                    if(! $retval ) {
                        die('Could not get data: ' . mysql_error());
                    }
                    echo "<table id='table' class='table table-striped table-bordered' align='center' data-sorting='true' style='max-width: 70%;text-align:left'>
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Username</th>
                                                    <th>Password</th>
                                                </tr>
                                            </thead>
                                            <tbody>"; while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)) { echo "
                                                <tr>
                                                    <td>".$row["id"]."</td>
                                                    <td>".$row["username"]."</td>
                                                    <td>".$row["password"]."</td>
                                                </tr>"; } echo "</tbody>
                                            </table>"; mysqli_close($link); ?>

            <p></p>
            <p></p>
            <h2>H2 Title</h2>
            <p>Paragraph</p>

            <div class="line"></div>
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