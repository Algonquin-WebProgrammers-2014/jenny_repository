<%-- Author: David Yu & Jenny Liu --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/loginStyle.css">
</head>
<body>
	<div style="width: 100%; text-align: center;">Please select syour language </div>
	<form class="form-1" method="POST" action="setsession">

		
		<p class="submit">
			<button class="submit" id="buttonexplode" type="submit" name="english" >
				<i class="icon-arrow-right icon-large">English</i>
			</button>
			<button class="create" id="buttonexplode" type="submit" name="french" >
				<i class="icon-arrow-right icon-large">French</i>
			</button>
			<button class="submitButton" id="buttonexplode" type="submit" name="chinese" >
				<i class="icon-arrow-right icon-large">Chinese</i>
			</button>
		</p>

	</form>
</body>
</html>