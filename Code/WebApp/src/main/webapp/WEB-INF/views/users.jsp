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
                            <!-- /.nav-second-level -->
                       
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Multiple Users</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
            	<form action="/bigdata/users"
								method="post" enctype="multipart/form-data">
								<div class="form-group">
								<span class="btn btn-default uplod-file"> Upload Data 
								<input type="file" name="csv" /> 
								<input type="hidden" name="image" value="x" size="30" />
			</span>
			</div>
            <div class="form-group col-lg-3">
									<input type="submit" value="Check"
										class="btn btn-primary btn-block">
								</div>
			   </form>
            </div>
           
             <div>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>SOC</th>
                                        <th>State</th>
                                        <th>Full-time Position</th>
                                        <th>Salary</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <c:forEach items="${requestScope.candidateDetails}"
												var="candidate" varStatus="loop1">
												<tr>
												
		                                        <td>${candidate.workField}</td>
		                                        <td>${candidate.state}</td>
		                                        <td>${candidate.fulltime}</td>
		                                        <td>${candidate.salary}</td>
		                                        <td>${candidate.status}</td>
												
													
												</tr>

												

											</c:forEach>
                                </tbody>
                            </table>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
           
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
