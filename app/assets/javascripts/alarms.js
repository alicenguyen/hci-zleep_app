$(document).ready(function() {
	console.log("HELLO WORLD");
	$(".onoffswitch-checkbox").on("change", function() {

		var url = $(this).data('url');



		if ($(this).is(":checked"))
        {
           console.log("ON " + this.id);
           $.ajax({
			type: "PUT",
			dataType: "json",
			url: url,
			data: {current_state: "on"},
			complete: function(data, textStatus){
				if (textStatus == "success") {
					console.log("GOOD");
				} else {
					console.log("BADDD");
				}
			}

		});
        }
        else{
           console.log("OFF " + this.id);
			$.ajax({
				type: "PUT",
				dataType: "json",
				url: url,
				data: {current_state: "off"},
				complete: function(data, textStatus){
					if (textStatus == "success") {
						console.log("GOOD");
					} else {
						console.log("BADDD");
					}
				}

			});
        }









	});







});



