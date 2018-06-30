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
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Skills Matrix</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <!-- Bootstrap CSS CDN -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">

        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/sidebar.css">

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

    </head>

    <body>
        <div class="wrapper">
            <!-- Sidebar Holder -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>Skills Matrix</h3>
                </div>

                <ul class="list-unstyled components">
                    <li class="active">
                    </li>
                    <li>
                        <a href="home.php"><i class="fas fa-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-user"></i> My Skills</a>
                    </li>
                    <li>
                        <a href="skillslist.php"><i class="fas fa-wrench"></i> Skills List</a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-users"></i> People</a>
                    </li>
                    <li>

                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fas fa-cog"></i> Administration</a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                            <li>

                                <a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle"><i class="fas fa-chart-pie"></i> Reports</a>
                                <ul class="collapse " id="pageSubmenu2">
                                    <li>
                                        <a href="#">By Skills</a>
                                    </li>
                                    <li>
                                        <a href="#">By Individual</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Manage Skills List</a>
                            </li>
                            <li>
                                <a href="#">Manage People</a>
                            </li>
                            <li>
                                <a href="#">Manage Departments</a>
                            </li>
                            <li>
                                <a href="#">Manage Locations</a>
                            </li>
                            <li>
                                <a href="#">Manage Roles</a>
                            </li>
                            <li>
                                <a href="#">Manage Rooms</a>
                            </li>
                            <li>
                                <a href="#">Manage Permissions</a>
                            </li>

                        </ul>
                    </li>
                </ul>

                <ul class="list-unstyled CTAs">

                    Logged as
                    <?php echo htmlspecialchars($_SESSION['username']); ?>

                        <li>
                            <a href="logout.php" class="article"><i class="fas fa-sign-out-alt"></i> Sign out</a>
                        </li>
                </ul>
            </nav>

            <!-- Page Content Holder -->
            <div id="content">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="navbar-btn">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-justify"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <p><a href="mailto:luiz1361@gmail.com?Subject=SkillsMatrix Bug Report" target="_top"" class="btn btn-danger"><i class="fas fa-bug"></i> Report a Bug</a> <a href="#" class="btn article" onclick="window.print();return false;"><i class="fa fa-print"></i> Print</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <?php
                    require_once '../private/db.inc.php';

                    $sql = 'SELECT * FROM users';
                    mysqli_select_db($link,'skillsmatrix');
                    $retval = mysqli_query( $link, $sql);

                    if(! $retval ) {
                        die('Could not get data: ' . mysql_error());
                    }
                    echo "<table id='table' class='table table-striped table-bordered' align='center' data-sorting='true' style='max-width: 70%;text-align:left' ><thead><tr><th>ID</th><th>Username</th><th>Password</th></tr></thead><tbody>";
                    while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)) {
                    echo "<tr><td>".$row["id"]."</td><td>".$row["username"]."</td><td>".$row["password"]."</td></tr>";
                    }
                            echo "</tbody></table>";

                    mysqli_close($link);
                ?>

                    <h2>Collapsible Sidebar Using Bootstrap 4</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                    <div class="line"></div>

                    <h2>Lorem Ipsum Dolor</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                    <div class="line"></div>

            </div>
        </div>
        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#sidebarCollapse').on('click', function() {
                    $('#sidebar').toggleClass('active');
                    $(this).toggleClass('active');
                });
            });
        </script>
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