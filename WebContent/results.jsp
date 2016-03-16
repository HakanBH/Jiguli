<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang=en>
<head>
<meta charset="UTF-8">
<title>Mobile.bg - Пазарът за автомобили в България.</title>
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width = device-width, initial-scale = 1">

<script type="text/javascript" src="yoxview/yoxview-init.js"></script>
<script type="text/javascript" src="yoxview/lang/bg.js"></script>
<link href="css/styles.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

<%@ include file = "header.jsp" %>
	
	<div class="container panel panel-primary">
		<div class="row">
			<div class="col-md-8">
				<ul class="pager">
					<li class="previous"><a href="#">&larr;Предишна страница</a></li>
					<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li class="next"><a href="#">Следваща страница &rarr;</a></li>
				</ul>
			</div>
		</div>
	</div>
	
<%@ include file = "footer.jsp" %>

</body>
</html>