window.addEventListener("load", function() {
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("input", function(){
    const formData = document.getElementById("item-price").value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.ceil(formData * 0.1);
    addProfit.innerHTML = Math.floor(formData - (formData * 0.1));
  });
})