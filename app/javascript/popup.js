
window.addEventListener('turbo:load',function(){
  const popup = document.querySelectorAll('.item-img');
  popup.forEach(function(link){
    link.addEventListener('mouseover',function(event){
      event.preventDefault();
      popup.start(link);
    });
  });
});