<?php
	include("include/db_connect.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

        <!--Nawigacja strony -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            
			
            <div class="navbar-header">
                <a class="navbar-brand" href="koszyk.html">Koszyk</a>
            </div>
			
			
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="index.html">Strona główna</a>
                    </li>
					<li>
						<a href="kategorie.html">Kategorie produktów</a>
					</li>
					<li>
                        <a href="oNas.html">O nas</a>
                    </li>
					<li>
                        <a href="kontakt.html">Kontakt</a>
                    </li>
					<li>
                        <a href="logowanie.html">Zaloguj się</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Kategorie produktów
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Strona główna</a>
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- Sidebar Column -->
            <div class="col-md-3">
                <div class="list-group">
                    <a href="krzesla.html" class="list-group-item">Krzesła</a>
                    <a href="stoly.html" class="list-group-item">Stoły</a>
                    <a href="hustawki.html" class="list-group-item">Huśtawki</a>
                    <a href="lawki.html" class="list-group-item">Ławki</a>
                </div>
                
            </div>
            <div class="col-md-9">
            <?php
	
    $result=mysql_query("SELECT * FROM produkt",$link);
 if (mysql_num_rows($result)>0)
 {
    $row=mysql_fetch_array($result);   
    
    do{
         
          
    echo'
    
    <div class="col-md-3 img-portfolio" id="test" >
   
    <a> 
    <img class="img-responsive img-hover" src="'.$row["image"].'">
    
  
    <h4>
   <a href="produkt.html"><center>'.$row["nazwa_produktu"].'</center></a>
    </h4>
    
        
    <p><strong><center>'.$row["cena_jednostkowa"].' zl.</center></strong> </p>
    
    
    </div>

    ';
    
    }
    
    
            while($row=mysql_fetch_array($result));  
 }
     
?>
            </div>
            <!-- Content Column -->
            
            <!-- Projects Row -->
          
</div>
        <!-- /.row -->
       <!--  <a href="produkt.html">      -->

        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->

        


        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy;</p>
                </div>
            </div>
        </footer>

    </div>
    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
