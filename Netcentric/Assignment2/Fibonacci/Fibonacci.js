var d = new Date();
var start = d.getTime();
document.write("<h2>Date and time of run : " + d.toLocaleString() + " </h2>"); 
document.write("<h3>Generating the first 50 Fibonacci numbers ... </h3>");
var array = new Array(51);
function fibonacci (number) {
	//if (array [number] > 0){
	//	return array[number];
	//}
	if (number == 1){
		return 0;
	}
	else if (number == 2){
		return 1;
	}
	else {
		array[number] = fibonacci (number - 1) + fibonacci (number - 2);
		return array[number];
	}
}
for (i = 1; i <= 50; i++){
	var val = fibonacci (i);
	document.write("<p>" + val + "</p>");
}
var n = new Date ();
var end  = n.getTime();
var time = end - start;
document.write("<h3> It took " + time + " milliseconds to generate the first 50 Fibonacci numbers");