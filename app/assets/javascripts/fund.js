(function ($) {
  addUser = function() {
    $(this).submit();
    clearUser();
  }

  clearUser = function() {
    $('.modal').modal('toggle');
    $('.modal input').val('');
  }

  $('#add_user').bind('ajax:send', function(xhr){
    $('#add_user input').val(''); $('.modal').modal('hide');
  })

  $('table').bind('change', function(){
    var total_money = cacutaleMoney()
    $('.total_money').val(total_money)
  })

  cacutaleMoney = function() {
    var sum = 0;
    $('.money').each(function() {
      sum += Number($(this).val());
    });
    return sum
  }

  $('tbody').bind('ajax:send', function(xhr){
    $('.modal').modal('hide');
  })
})(jQuery);

$(document).ready(function() {
  if($(".js-example-basic-single").length){
    $(".js-example-basic-single").select2();
  }
});
