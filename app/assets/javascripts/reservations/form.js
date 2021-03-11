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

    var unavailableDates = ["20-3-2021", "14-3-2021", "15-3-2021"];

    function unavailable(date) {
        dmy = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
        if ($.inArray(dmy, unavailableDates) == -1) {
            return [true, ""];
        } else {
            return [false, "", "Unavailable"];
        }
    }

    $(".js-datepicker").datepicker({
        dateFormat: 'dd MM yy',
        beforeShowDay: unavailable
    });
  })()
});
