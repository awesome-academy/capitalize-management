(function() {
  var handleConfirm = function(element) {
    if (!allowAction(this)) {
      Rails.stopEverything(element)
    }
  }

  var allowAction = function(element) {
    if (element.getAttribute('data-confirm-swal') === null) {
      return true
    }

    showConfirmationDialog(element)
    return false
  }

  var showConfirmationDialog = function(element) {
    var message = element.getAttribute('data-confirm-swal')
    var text = element.getAttribute('data-text')

    swal({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      buttons: {
        cancel: {
          text: "Cancel",
          value: null,
          visible: true,
          className: "btn btn-danger",
          closeModal: true,
        },
        confirm: {
          text: "OK",
          value: true,
          visible: true,
          className: "btn btn-primary",
          closeModal: true
        }
      }
    }).then(function(result) {
      confirmed(element, result)
    })
  }

  var confirmed = function(element, result) {
    if (result) {
      element.removeAttribute('data-confirm-swal')
      element.click()
    }
  }

  document.addEventListener('rails:attachBindings', function(e) {
    Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm)
  })

}).call(this)
