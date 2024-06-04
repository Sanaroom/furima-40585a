window.addEventListener('turbo:load', function(){

  const button = document.getElementById('count-button');
  const countElement = document.querySelector('.star-count');

  button.addEventListener('click', function(event) {
    event.preventDefault();
    if (localStorage.getItem('starClicked') === 'true') {
      alert('You can only increment the count once.');
      return;
    }

    const currentCount = parseInt(countElement.textContent, 10);
    countElement.textContent = currentCount + 1;

    localStorage.setItem('starClicked', 'true');
  });
});