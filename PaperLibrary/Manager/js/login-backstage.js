$(function(){
	$(".login-container").height($(window).height());
	$(window).resize(function(){
		$(".login-container").height($(window).height());
	})
	$(".jump-search").click(function(){
		location.href="/";
	})
	$(".verify").click(function () {
	    $(this).attr("src", "validate.aspx?" + new Date());

	});
})