jQuery(document).on('turbo:load', function(){
  $('#username').mouseover(function(e) {
      $('ul', this).stop().slideDown('normal');
  })
  .mouseout(function(e) {
      $('ul', this).stop().slideUp('normal');
  });
});
  