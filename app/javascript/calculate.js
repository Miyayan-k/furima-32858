function calculate (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const getPrice = itemPrice.value;
    const getFee = document.getElementById("add-tax-price");
    getFee.innerHTML = `${getPrice * 0.1}`;
  });
}

window.addEventListener('load', calculate);