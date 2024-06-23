window.addEventListener('turbo:load',function(){
  const favorite=document.getElementById("favorite-b")

  if (favorite != null){
  favorite.addEventListener('mouseover',function(){
    favorite.setAttribute("style","background-color:#ffb340;")
  })
  favorite.addEventListener('mouseout',function(){
    favorite.removeAttribute("style","background-color:#ffb340;")
  });
  };
});