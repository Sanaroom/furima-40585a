window.addEventListener('turbo:load', function(){
  console.log("turbo:load event fired");
  const button = document.getElementById('count-button');
  const countElement =  document.querySelector('.star-count');

    button.addEventListener('click', function(event) {
      event.preventDefault();
      const currentCount = parseInt(countElement.textContent, 10);
      countElement.textContent = currentCount + 1;
    });
  });

