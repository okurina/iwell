document.addEventListener('turbo:load', function() {
  let btn = document.getElementById('del-btn');
  btn.addEventListener('click', function(event) {

    let result = window.confirm('削除しますか？');
    if (result) {
      console.log('OK');
    } else {
      event.preventDefault();
    }
  });
});