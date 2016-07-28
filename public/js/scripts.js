$(document).ready(function(){
  $('#login-link').click(function(){
    $('.login-form').slideToggle();
  });

  $('#login-link-side').click(function(){
    $('.login-form-side').toggle();
  });
});
