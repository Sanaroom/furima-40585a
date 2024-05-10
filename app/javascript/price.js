window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price"); // 価格入力フィールドのID
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price"); // 手数料表示要素のID
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const profitNumber = document.getElementById("profit") // 利益表示要素のID
    profitNumber.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  })
});