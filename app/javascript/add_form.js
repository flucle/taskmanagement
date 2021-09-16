if (document.URL.match('/tasks/new')) {
  window.onload = function() {
    for (let i = 0; i < 9; i++) {
      $('.form-add-button').trigger('click');
    }
  }
}
