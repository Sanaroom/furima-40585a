const price = () => {

  const priceInput = document.getElementById("item-price");


  priceInput.addEventListener("input", function(){
    
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const profitNumber = document.getElementById("profit") 
    profitNumber.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
 });
};


window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);

