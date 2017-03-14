
function genRandomInt() {
	var value = Math.floor(1 + Math.random() * 6);
	return value; 
}


function computeSum(a, b) {
	return a + b;
}

var array = new Array(13);
for (i = 0; i <= 12; i++){
	array[i] = 0;
}

for (i = 0; i < 36000; i++){
	var first = genRandomInt();
	var second = genRandomInt();
	var sum = computeSum (first, second);
	array[sum]++;
}

var table = document.getElementById("myTableData");
for (i = 2; i <= 12; i++){
	var rowCount = table.rows.length;
	var row = table.insertRow(rowCount);
	row.insertCell(0).innerHTML = "<center>" + i + "</center>";
    row.insertCell(1).innerHTML = "<center>" + array[i] + "</center>";
    row.insertCell(2).innerHTML = "<center>" + (array[i] / 36000 * 100).toFixed(2) + "% </center>";
	//document.write("<p>" + i + ": " +  + "</p>");
}