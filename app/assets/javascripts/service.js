
function pagechange (tab) {

	event.preventDefault();

	const tabname = $(tab).attr('id');

	$.ajax({

		url: "/services/",
		method:'get',
		dataType: 'json',
		data: {
			query: tabname
			},
		success: function(data){

			$('.sub-nav').find('li').removeClass("active");

			for (var i = 0; i < $(".sub-nav").find("li").length; i++) {

				var selection = $(".sub-nav").find("li")[i]
				if ($(selection).attr("id") == $(tab).attr("id")) {

				
				$(selection).addClass("active");

				}
				
			}

			console.log(data.length)
			if (data.length > 0) {

				$("#content").empty();
				for (var i = 0; i < data.length; i++) {

					var person = $('<div></div>').addClass('person');
					var link = $('<a class = "link"></a>').attr('href', 'services/'+ data[i]["id"]);
					var img = $('<div></div>').addClass('img');
					var email = $('<div></div>').addClass('email');
					person.append(img, email);
					link.append(person); 					
					$("#content").append(link);
					$($(".email")[i]).html(data[i]["email"]);

					//$($("img")[i]).src(data[i]["photos"])等有照片功能在加

				}

				console.log($(".person"));

			}
			else{

				$("#content").html("尚無資料")

			}

					

		}

	});
	

}