window.addEventListener('turbo:load', function(){
  const category = document.getElementById("category-list");
  const pullDownMenu = document.getElementById("category-pull-down");

  category.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color: skyblue;");
  });
  category.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color: skyblue;");
  });

  category.addEventListener('click', function() {
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      pullDownMenu.removeAttribute("style", "display:block;");
    } else {
      pullDownMenu.setAttribute("style", "display:block;");
    }
  });
});

