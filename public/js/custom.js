$(document).ready(function(){
  var burger = $('.burger');
  var menu = $('#' + burger.data('target'));
  burger.on('click', function() {
    burger.toggleClass('is-active');
    menu.toggleClass('is-active');
  });
});