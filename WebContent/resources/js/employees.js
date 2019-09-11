$(document).ready(function(){
	$("#list").click(function (){
		$("#listlink").show();
		$("#cardlink").hide();
	});
		
	$("#card").click(function (){
		$("#listlink").hide();
		$("#cardlink").show();
	});
	
	var container = document.getElementById("btn-group");
	var btns = container.getElementsByClassName("btn btn-default btn-xs");
	for (var i = 0; i < btns.length; i++) {
	  btns[i].addEventListener("click", function() {
	    var current = document.getElementsByClassName("active");
	    current[0].className = current[0].className.replace(" active", "");
	    this.className += " active";
	  });
	}
	
})