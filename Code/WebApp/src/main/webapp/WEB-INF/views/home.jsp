<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>H1-B Visa Eligibility Status</title>

    <link href="<c:url value="/resources/Styles/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">


    <link href="<c:url value="/resources/Styles/vendor/metisMenu/metisMenu.min.css" />" rel="stylesheet">

    <link href="<c:url value="/resources/Styles/dist/css/sb-admin-2.css" />" rel="stylesheet">

    <link href="<c:url value="/resources/Styles/vendor/morrisjs/morris.css" />" rel="stylesheet">

    <link href="<c:url value="/resources/Styles/vendor/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

   

</head>

<body>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/bigdata">H1-B Visa Eligibility Status</a>
            </div>
         

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    
                       <li>
                            <a href="/bigdata"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="/bigdata/user"><i class="fa fa-bar-chart-o fa-fw"></i> Single User</a>
                          
                        </li>
                        <li>
                            <a href="/bigdata/users"><i class="fa fa-table fa-fw"></i> Multiple Users</a>
                        </li>
                      
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Analysis of H1-B Visa Petitions dataset using Hadoop and R</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
          
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> State Vs Avg Wage Analysis
                           
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <img class="img-responsive"
											src="${contextPath}/resources/Images/bar1.jpeg"
											alt="">
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <br/>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Case_Status Vs Year Analysis
                           
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
							<img class="img-responsive" style="float:left"
											src="${contextPath}/resources/Images/bar5.jpeg"
											alt="">				
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                   
                    <br/>
                    
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Top 10 States with most Certified Applications & full-time position Analysis
                        </div>
                        <!-- /.panel-heading -->
                      <div class="panel-body">
                            <img class="img-responsive" style="float:left;width:40%"
											src="${contextPath}/resources/Images/bar4.jpeg"
											alt="">
							<img class="img-responsive" style="float:right;width:50%"
											src="${contextPath}/resources/Images/bar6.jpeg"
											alt="">				
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
               
                <!-- /.col-lg-4 -->
            </div>
            <br/>
            
            <div class="row">
             <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-database fa-fw"></i> Technologies Used
                        </div>
                        <!-- /.panel-heading -->
                      <div class="panel-body">
		                      <img class="img-responsive" style="margin-right:35px;float:left"
													src="${contextPath}/resources/Images/cloud.png"
													alt="">
                            <img class="img-responsive" style="margin-right:35px;float:left"
											src="${contextPath}/resources/Images/tech.png"
											alt="">
							
							<img class="img-responsive" style="margin:auto;float:left;width:25%"
											src="${contextPath}/resources/Images/spring.png"
											alt="">								
                        </div>
                        <!-- /.panel-body -->
                    </div>
            </div>
            
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<c:url value="/resources/Styles/vendor/jquery/jquery.min.js" />"></script>

    <script src="<c:url value="/resources/Styles/vendor/bootstrap/js/bootstrap.min.js" />"></script>

    <script src="<c:url value="/resources/Styles/vendor/metisMenu/metisMenu.min.js" />"></script>

    <script src="<c:url value="/resources/Styles/vendor/raphael/raphael.min.js" />"></script>
    <script src="<c:url value="/resources/Styles/vendor/morrisjs/morris.min.js" />"></script>
    <script src="<c:url value="/resources/Styles/data/morris-data.js" />"></script>

    <script src="<c:url value="/resources/Styles/dist/js/sb-admin-2.js" />"></script>

</body>

</html>
