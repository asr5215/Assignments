function olives(){
	//alert("Hello");
    var olives = document.getElementsByName("olives");
	var total = 0;
	//alert(total);
	if (!olives.checked){
		total = 5.00;
		//alert(total);
	}
	else{
		total = 0.00;
		//alert(total);
	}
	document.getElementById("total").value = "$" + total;
}

function myFunction(c){
	//alert(c);
	document.getElementById("color1").style.color = c;
}

function banana(){
    var apple = document.getElementById("banana");
	if (apple.checked){
		document.getElementById("total").value = (0.39 + 
			parseFloat(document.getElementById("total").value)).toFixed(2);
	}
	else{
		document.getElementById("total").value = (-0.39 + 
			parseFloat(document.getElementById("total").value)).toFixed(2);		
	}
}

function check(){
    var apple = parseInt(document.getElementById("apple1").value);
    var orange = parseInt(document.getElementById("orange1").value);
    var banana = parseInt(document.getElementById("banana1").value);
	var total = apple * 0.59 + orange * 0.49 + banana * 0.39;
	document.getElementById("total1").value = total.toFixed(2);	
}

function chkName() {
  var myName = document.getElementById("custName");

// Test the format of the input name 
//  Allow the spaces after the commas to be optional
//  Allow the period after the initial to be optional

  var pos = myName.value.search(
            /^[A-Z][a-z]+, ?[A-Z][a-z]+, ?[A-Z]\.?$/);

  if (pos != 0) {
    alert("The name you entered (" + myName.value + 
          ") is not in the correct form. \n" +
          "The correct form is: " +
          "last-name, first-name, middle-initial \n" +
          "Please go back and fix your name");
    return false;
  } else
    return true;
}