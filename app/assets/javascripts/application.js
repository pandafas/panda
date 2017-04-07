// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$( document ).ready(function() {
// Submit Button
	$('#submit').on('click', function() {
		// if form submit not working later remove this
		event.preventDefault();
		////////////////////////
		var comment = $('#message-box').val();
		var name = $('#name').val();
		var phone = $('#phone').val();
		var email = $('#email').val();

		if(comment === '') {
			$('#message-box').css('border', '2px solid red');
		} else {


		$('#visible-comment').html(comment);
		$('#message-box').hide();
		$('#visible-comment').html(comment.toUpperCase());
		$('#visible-comment').css('background-color', '#cecfc3');
		
		
		$('#visible-name').html(name);
		$('#name').hide();
		$('#visible-name').html(name.toUpperCase());
		$('#name').css ('background-color', 'red');
		$('#visible-name').css('background-color', '#cecfc3');

		
		$('#visible-phone').html(phone);
		$('#phone').hide();
		$('#visible-phone').html(phone.toUpperCase());
		$('#visible-phone').css('background-color', '#cecfc3');

		
		$('#visible-email').html(email);
		$('#email').hide();
		$('#visible-email').html(email.toUpperCase());
		$('#visible-email').css('background-color', '#cecfc3');
	}
		return false;
	});
});