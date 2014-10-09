<%-- Author: David Yu & Jenny Liu --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
</head>
<body>
	
	<div class="outer-center-vertical-parent" style="width:100%; height: 100%; display: table; position: absolute;">
		<div class="middle-center-vertical-parent" style="display:table-cell; vertical-align: middle;">
			<div style="width: 100%; text-align: center; color:#fff; font-size:28px;margin-bottom:20px;font-family: Bodoni MT;text-shadow: 3px 1px 2px rgba(150, 150, 150, 0.92);">Please select your language </div>
		
			<form id="effectsExplode" class="form-1" method="POST" action="sessionsetter" >
		
					<button class="lang-submit" id="buttonexplode" type="submit" name="english" >
						<i class="icon-arrow-right icon-large">English</i>
					</button>
					<button class="lang-submit" id="buttonexplode" type="submit" name="french" >
						<i class="icon-arrow-right icon-large">French</i>
					</button>
					<button class="lang-submit" id="buttonexplode" type="submit" name="chinese" >
						<i class="icon-arrow-right icon-large">Chinese</i>
					</button>
				
			</form>
		</div>
		
	</div>
	
</body>
</html>