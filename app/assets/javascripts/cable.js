// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

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
		$('#visible-comment').css('background-color', '#ffcccc');
		
		
		$('#visible-name').html(name);
		$('#name').hide();
		$('#visible-name').html(name.toUpperCase());
		$('#name').css ('background-color', 'red');
		$('#visible-name').css('background-color', '#ffcccc');

		
		$('#visible-phone').html(phone);
		$('#phone').hide();
		$('#visible-phone').html(phone.toUpperCase());
		$('#visible-phone').css('background-color', '#ffcccc');

		
		$('#visible-email').html(email);
		$('#email').hide();
		$('#visible-email').html(email.toUpperCase());
		$('#visible-email').css('background-color', '#ffcccc');
	}
		return false;
	});