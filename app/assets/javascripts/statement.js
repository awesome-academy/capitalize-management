(function ($) {
  showLoss = function(loss){
    var loss = I18n.toCurrency(loss);
    $('#loss').html(loss);
  }

  showProfit = function(profit){
    var profit = I18n.toCurrency(profit);
    $('#profits').html(profit);
  }

  caculateLoss = function(){
    var loss = 0;
    return loss = $('input[id="statement_stop_loss"]').val()*$('#statement_money').val()/100
  }

  caculateProfit = function(){
    var profit = 0;
    return profit = $('input[id="statement_take_profit"]').val()*$('#statement_money').val()/100
  }

  caculateLoss();
  $('input[id="statement_stop_loss"]').change(function(){
    $('input[id="statement_loss"]').val(caculateLoss);
  });

  caculateProfit();
  $('input[id="statement_take_profit"]').change(function(){
    $('input[id="statement_profit"]').val(caculateProfit);
  });
})(jQuery);
