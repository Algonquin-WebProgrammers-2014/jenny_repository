/**
 * 
 */

function info(elem) {
//	alert(elem.id);
	var id = elem.id;
	var div = document.getElementById("info"+id);
	if(div.style.display == "block") {
		div.style.display='none';
	} else {
		div.style.display='block';
	}
}

function clearOrder(elem) {
	var id = elem.id;
	var path = "http://" + window.location.host + "/webapplicationProject/updatedata";
	document.location.href = path;
}