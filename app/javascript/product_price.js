const price = () =>  {
   const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input" ,() => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1));
})
};

document.addEventListener("turbo:load", price);
document.addEventListener("turbo:render", price);