$( document ).ready(function() {
  (function(){
    $(document).on("change", "input.js-quantity",function(){
      var roomPricePerPerson = $(".js-room-price-per-person").val();
      var quantity = $(this).val();
      var payButtom = $(".js-pay-buttom");
      var total = roomPricePerPerson * quantity;
      console.log(total)
      var format_total = payButtom.data("text").replace("_total_", total)
      payButtom.prop("value", format_total);
    })
  })()
});
