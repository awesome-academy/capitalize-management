$(document).ready(function() {
  var color = {'error': '#f2a654', 'info': '#46c35f', 'success': '#f96868', 'warning': '#57c7d4'}

  showError = function(msg) {
    $.toast({
      heading: 'Danger',
      text: msg,
      showHideTransition: 'slide',
      icon: 'error',
      loaderBg: '#f2a654',
      position: 'top-right'
    });
  }

  showFlash = function(type, msg) {
    $.toast({
      heading: type,
      text: msg,
      showHideTransition: 'slide',
      icon: type,
      loaderBg: color[type],
      position: 'top-right'
    });
  }
});
