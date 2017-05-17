$(document).ready(function() {
  $("#list_2nd li").hover(
    function() {
      $(this).find('ul').slideDown();
    },
    function() {
      $(this).find('ul').slideUp();
    });
});