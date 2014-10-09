/**
 * 
 */
var timer = 0;

function toPerform(v,id)
{
	if(v.value === "Save") 
	{
		toEdit(v,id); 
	} 
	else if(v.value === "Edit") 
	{
		toSave(v,id);
	}
	
}

function toSave(v,id) 
{
	v.className = 'save-button'
	v.value = 'Save'
		
	var smallV = document.getElementById('ismall'+id).getElementsByTagName('span')[0].innerHTML;
	var mediumV = document.getElementById('imedium'+id).getElementsByTagName('span')[0].innerHTML;
	var largeV = document.getElementById('ilarge'+id).getElementsByTagName('span')[0].innerHTML;
	var xLargeV = document.getElementById('ixlarge'+id).getElementsByTagName('span')[0].innerHTML;
	
	
	document.getElementById('ismall'+id).innerHTML = createInputString(smallV);
	document.getElementById('imedium'+id).innerHTML = createInputString(mediumV);
	document.getElementById('ilarge'+id).innerHTML = createInputString(largeV);
	document.getElementById('ixlarge'+id).innerHTML = createInputString(xLargeV);
}

function toEdit(v,id) 
{
	var xmlhttp;
	
	var smallV = document.getElementById('ismall'+id).getElementsByTagName('input')[0].value;
	var mediumV = document.getElementById('imedium'+id).getElementsByTagName('input')[0].value;
	var largeV = document.getElementById('ilarge'+id).getElementsByTagName('input')[0].value;
	var xLargeV = document.getElementById('ixlarge'+id).getElementsByTagName('input')[0].value;
	
	if(isNaN(smallV) || isNaN(mediumV) || isNaN(largeV) || isNaN(xLargeV)){
		callNotication("WARNING: Must Input Number", 1);
		return false;
	}
	
	if(smallV < 0 || mediumV < 0 || largeV < 0|| xLargeV < 0){
		callNotication("WARNING: Must be a Positive Number", 1);
		return false;
	}
	
	v.className = 'edit-button'
	v.value = 'Edit'
	
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHttp");
	}
	
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			var response = xmlhttp.responseText;
			var responseArray = response.split(":");
			
			document.getElementById('pizza-total').innerHTML = "$" + responseArray[0];
			document.getElementById("pizza-cart-item-number").innerHTML= responseArray[1];
			
			document.getElementById('ismall'+id).innerHTML = createSpanString(smallV);
			document.getElementById('imedium'+id).innerHTML = createSpanString(mediumV);
			document.getElementById('ilarge'+id).innerHTML = createSpanString(largeV);
			document.getElementById('ixlarge'+id).innerHTML = createSpanString(xLargeV);
			
			callNotication("Items are Updated", 0);
		}
	}
	
	xmlhttp.open("GET", "http://" + window.location.host + "/webapplicationProject/cartupdate?edit=y&initial="+ id +"&s="+ smallV +"&m="+ mediumV +"&l="+ largeV +"&xl="+ xLargeV +"");
	xmlhttp.send();
}

function createSpanString(value)
{
	return "<span>" + value + "</span>";
}

function createInputString(value)
{
	return '<input type="text" value='+ value + ' maxlength="2" size="2"/>'
}

function callNotication(s,t){
	
	if(timer)
	{
		clearTimeout(timer);
		timer = 0;
	}
	
	document.getElementById('floating-notif').innerHTML = s;

	if(t == 1)
	{
		document.getElementById('floating-notif').className = 'error-notif';
		document.getElementById('floating-notif').setAttribute("style", "color:white;display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	} else {
		document.getElementById('floating-notif').className = 'floating-notif';
		document.getElementById('floating-notif').setAttribute("style", "color:black;display:block; animation: fadein 0.5s;-moz-animation: fadein 0.5s; -webkit-animation: fadein 0.5s;-o-animation: fadein 0.5s;");
	}
	
	timer = setTimeout(hideFloatinNotif, 3000);
}

function hideFloatinNotif(){
	document.getElementById('floating-notif').setAttribute("style", "display:none;");
}