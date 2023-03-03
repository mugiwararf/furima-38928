window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price")
   const proFitDom = document.getElementById("profit")
   addTaxDom.innerHTML = Math.floor( inputValue * 0.1 )
   proFitDom.innerHTML = inputValue - addTaxDom.innerHTML
  })
})
