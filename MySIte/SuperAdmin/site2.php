<?php

session_start(); 
$servername   = "localhost";
$database = "mutah_housing";
$username = "root";
$password = "";
$conn = new mysqli($servername, $username, $password, $database);


if (!isset($_SESSION['role'])) {
    $_SESSION['msg'] = "You must log in first";
    header('location: ../index.php');
}
if (isset($_GET['logout'])) {
    session_destroy();
    unset($_SESSION['username']);
    header("location: index.php");
}
if ($_SESSION['role']<> "SuperAdmin") {
  header("location: ../index.php");


}


?>



<!DOCTYPE html>
<html>

<head>
    <title>Programming Knowledge Login</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a2c7be3264.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href=" css/site2.css ">
</head>

<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark" style="direction:rtl">
        <!-- Brand -->
        <a class="navbar-brand" href="#">
            <img src="../images/pesronlogo.ico" alt="Logo" style="width:40px;">
        </a>
        <li class="nav-item dropdown">

        <?php

echo("<a class='dropdown-toggle' href='#' id='navbarDropdownMenuLink' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='text-decoration: none;'>". $_SESSION['name'] ."</a>");
?>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#">الصفحة الشخصية</a>
                
                <a class="dropdown-item" href="../logout.php">تسجيل الخروج</a>
            </div>
        </li>
        <!-- Toggler/collapsibe Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar links -->
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.php">إدارة المباني والغرف</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="site3.php">إدارة الطلاب</a>
                </li>
               
               
               
            </ul>
        </div>
    </nav>
    <div class="container h-100">
        <div class="d-flex justify-content-center h-100">
            <div class="user_card ">
                <div class="d-flex justify-content-center ">
                    <h4>صفحة الادارة على المشرفين</h4>
                </div><br><br>
                <div class="d-flex justify-content-center from_container">
                <form method="POST" action="../code.php">

                <div class="row">
          <div class="col">
         <button type="submit" class="btn btn-primary">
         <i class="fas fa-search"></i>
         </button>
         </div>
        <div class="col-sm-10">
        <div class="input-group mb-3 ">
        <input type="search" id="form1" class="form-control" placeholder="ابحث عن مشرف ...">
        </div>
        </div>

        </div>

         <br>
        <br>

                        
                            <div class="row">
                                 <div class="col ">
     <select class="form-select" aria-label="Default select example" name="building_char">
     <option selected>اختر رمز المبنى</option>
    

     <?php
$query = "SELECT building_ID , building_char FROM building ";
$results = mysqli_query($conn, $query);
if (mysqli_num_rows($results) >= 1) {
  while($row = $results->fetch_assoc()) {
     $building_ID = $row['building_ID'];
     $building_char = $row['building_char'];
echo("<option value='$building_ID'>$building_char</option>");
  }}
?>
    
    
   </select>
 </div>


                                <div class=" col ">
                                    <div class="input-group mb-3 ">
                                        <input type="password" class="form-control " name="password" id="password " required placeholder="الرقم السري"></div>
                                </div>
                                <div class="col ">
                                    <div class="input-group mb-3 ">
                                        <input type="text " class="form-control " name="admin_email" id="admin_email " required placeholder="ايميل المشرف"></div>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col ">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" name="admin_name" id="admin_name" required placeholder="اسم المشرف">
                            </div>
                        </div>

                        <div class="col ">
           <div class="input-group mb-3">
               <input type="text" class="form-control" name="ID_Num" id="ID_Num" required placeholder="رقم الهوية">

           </div>


       </div>
       <div class="col ">
           <div class="input-group mb-3">
               <input type="text" class="form-control" name="admin_phone" id="admin_phone" required placeholder="رقم الهاتف">
           </div>
       </div>
</div>
       <br><br><br>

                        <div>
                            <div class="row">
                                <div class=" col ">
                                    <div class="d-flex justify-content-center mt3 login-contaier">
                                        <button type="submit" name="del_admin" id="del_admin" class="btn btn-primary">حذف مشرف</button>
                                    </div>
                                </div>
                                <div class=" col ">
                                    <div class="d-flex justify-content-center mt3 login-contaier">
                                        <button type="submit" name="add_admin" id="add_admin" class="btn btn-primary">اضافة مشرف</button>
                                    </div>
                                </div>
                            </div><br><br><br><br><br>
                    </form>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js " integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin=" anonymous "></script>
                    <script type="text/javascript " src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js ">
                    </script>

</body>

</html>