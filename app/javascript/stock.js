document.addEventListener('turbo:load', () => {
  const stockInput = document.getElementById("current-stock");
  if (!stockInput) { return false; }

  function updateStock() {
    const inputValue = parseInt(stockInput.value, 10) || 0;
    const addStock = document.getElementById("update");
    const addStockValue = parseInt(addStock.value, 10) || 0;
    const result = inputValue + addStockValue;
    stockInput.value = result.toString();
  }

  const updateButton = document.querySelector('#stock-update button');
  if (updateButton) {
    updateButton.addEventListener('click', updateStock);
  }

  // グローバルスコープにも関数を定義
  window.updateStock = updateStock;
});
