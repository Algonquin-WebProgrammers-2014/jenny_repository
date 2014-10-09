/**
 * 
 */
var timer = 0;

function addToCart(id){
//	alert(document.getElementById('pizza-title'+id).innerHTML);
	
	var xmlhttp;
	var initial = document.getElementById("pizza-title"+id).getAttribute('initial');
	var name = document.getElementById("pizza-title"+id).getAttribute('pizza');
	var type = document.getElementById("pizza-title"+id).getAttribute('type');
	
	var small = document.getElementById("ismall"+id).value;
	var medium = document.getElementById("imedium"+id).value;
	var large = document.getElementById("ilarge"+id).value;
	var xlarge = document.getElementById("ixlarge"+id).value;
	
	if(isNaN(small) || isNaN(medium) || isNaN(large) || isNaN(xlarge)){
		alert("Must Input Number");
		resetInput(id);
		return false;
	}
	
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	} else 
	{
		xmlhttp = new ActiveXObject("Microsoft.XMLHttp");
	}
	
	xmlhttp.onreadystatechange = function() 
	{
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			if(timer)
			{
				clearTimeout(timer);
				timer = 0;
			}
			document.getElementById("pizza-cart-item-number").innerHTML=xmlhttp.responseText;
			document.getElementById('floating-notif').innerHTML = (saveParseString(small) + saveParseString(medium) + saveParseString(large) + saveParseString(xlarge)) + " new items added to the pizza cart"
			document.getElementById('floating-notif').setAttribute("style", "display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
			timer = setTimeout(hideFloatinNotif, 3000);
		}
	}
	
	xmlhttp.open("GET", "http://" + window.location.host + "/webapplicationProject/cartupdate?type="+ type +"&name="+ name +"&initial=" + initial + "&s=" + small + "&m=" + medium + "&l=" + large + "&xl=" + xlarge);
	xmlhttp.send();
	
	resetInput(id);
	
}

function resetInput(id){
	document.getElementById("ismall"+id).value = '';
	document.getElementById("imedium"+id).value = '';
	document.getElementById("ilarge"+id).value = '';
	document.getElementById("ixlarge"+id).value = '';
}

function saveParseString(s){
	if(!s)
		return 0;
	else
		return parseInt(s);
} 

function hideFloatinNotif(){
	document.getElementById('floating-notif').setAttribute("style", "display:none;");

}