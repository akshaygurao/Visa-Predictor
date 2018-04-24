<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


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
            <!-- /.navbar-header -->

       

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
                    <h1 class="page-header">Single User</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
           
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           
                          	<form action="/bigdata/user"
								method="post">

								<div class="form-group">

								<select class="form-control" name="fow" required>
									<option value="" selected>Select SOC</option>
									<option value="ACCOUNTANT">ACCOUNTANT</option>
									<option value="ENGINEER">ENGINEER</option>
									<option value="EXECUTIVE">EXECUTIVE</option>
									<option value="MANAGER">MANAGER</option>
									<option value="TECHNICIAN">TECHNICIAN</option>
								</select>
								
								</div>
								
								<div class="form-group">

								<select class="form-control" name="state" required>
									<option value="" selected="selected">Select State</option>
									  <option value="AL">Alabama</option>
									  <option value="AK">Alaska</option>
									  <option value="AZ">Arizona</option>
									  <option value="AR">Arkansas</option>
									  <option value="CA">California</option>
									  <option value="CO">Colorado</option>
									  <option value="CT">Connecticut</option>
									  <option value="DE">Delaware</option>
									  <option value="DC">District Of Columbia</option>
									  <option value="FL">Florida</option>
									  <option value="GA">Georgia</option>
									  <option value="HI">Hawaii</option>
									  <option value="ID">Idaho</option>
									  <option value="IL">Illinois</option>
									  <option value="IN">Indiana</option>
									  <option value="IA">Iowa</option>
									  <option value="KS">Kansas</option>
									  <option value="KY">Kentucky</option>
									  <option value="LA">Louisiana</option>
									  <option value="ME">Maine</option>
									  <option value="MD">Maryland</option>
									  <option value="MA">Massachusetts</option>
									  <option value="MI">Michigan</option>
									  <option value="MN">Minnesota</option>
									  <option value="MS">Mississippi</option>
									  <option value="MO">Missouri</option>
									  <option value="MT">Montana</option>
									  <option value="NE">Nebraska</option>
									  <option value="NV">Nevada</option>
									  <option value="NH">New Hampshire</option>
									  <option value="NJ">New Jersey</option>
									  <option value="NM">New Mexico</option>
									  <option value="NY">New York</option>
									  <option value="NC">North Carolina</option>
									  <option value="ND">North Dakota</option>
									  <option value="OH">Ohio</option>
									  <option value="OK">Oklahoma</option>
									  <option value="OR">Oregon</option>
									  <option value="PA">Pennsylvania</option>
									  <option value="RI">Rhode Island</option>
									  <option value="SC">South Carolina</option>
									  <option value="SD">South Dakota</option>
									  <option value="TN">Tennessee</option>
									  <option value="TX">Texas</option>
									  <option value="UT">Utah</option>
									  <option value="VT">Vermont</option>
									  <option value="VA">Virginia</option>
									  <option value="WA">Washington</option>
									  <option value="WV">West Virginia</option>
									  <option value="WI">Wisconsin</option>
									  <option value="WY">Wyoming</option>
								</select>
								</div>
								
								<div class="form-group">

								<select class="form-control" name="position" required>
									<option value="" selected>Full-Time Position</option>
									<option value="Yes">Yes</option>
									<option value="No">No</option>
								</select>
								</div>
								
								
								<div class="form-group">
									<input class="form-control" name="salary" 
										placeholder="Salary per annum" required type="number">
								</div>
								
								<div class="form-group">
									<input type="submit" value="Check"
										class="btn btn-primary btn-block">
								</div>
								<c:if test="${!empty requestScope.error}">
									<p style="color: red">Invalid credentials</p>
								</c:if>

							</form>
                           
                        </div>
                        <!-- /.panel-heading -->
                       
                        <!-- /.panel-body -->
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Eligibility Status
                        </div>
                        <div class="panel-body">
                            <div id="morris-donut-chart"></div>
                            ${sessionScope.eligibility}
                        </div>
                        <!-- /.panel-body -->
                    </div>
                  
                        <!-- /.panel-footer -->
                    </div>
                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
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
