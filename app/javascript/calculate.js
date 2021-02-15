function calculate (){
  if (document.URL.match(/items/) || document.URL.match(/new/)) {
    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener("keyup", () => {
      const getPrice = itemPrice.value;
      if(isNaN(getPrice)) return 0;
      const getFee = document.getElementById("add-tax-price");
      getFee.innerHTML = `${Math.floor(getPrice * 0.1)}`;
      const getProfit = document.getElementById("profit");
      getProfit.innerHTML = `${getPrice - Math.floor(getPrice * 0.1)}`;
    });
  }
}

window.addEventListener('load', calculate);