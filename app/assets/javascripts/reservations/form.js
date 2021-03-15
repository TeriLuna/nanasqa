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

    var start_date = $(".js-datepicker-conteiner").data("unavailables-dates")[0];
    var end_date = $(".js-datepicker-conteiner").data("unavailables-dates")[1];
    var unavailableDates = [];

    for (var d = new Date(start_date.split("-")[2], start_date.split("-")[1] - 1 , start_date.split("-")[0]); d <= new Date(end_date.split("-")[2], (parseInt(end_date.split("-")[1]) - 1), end_date.split("-")[0]); d.setDate(d.getDate() + 1)) {
      d = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
      d = new Date(d)
      unavailableDates.push(d);
    }

    var unavailable = function (date) {
      console.log(date)
      dmy = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
      unavailableDatesString = []
      $.each(unavailableDates, function(i, date){
        var date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()
        unavailableDatesString.push(date)
      })

      if ($.inArray(dmy, unavailableDatesString) == -1) {
        return [true, ""];
      } else {
        return [false, "", "Booked"];
      }
    }

    $("#js-datepicker-id").dateRangePicker(
      {
        format: "DD/MM/Y",
        dateFormat: "DD/MM/Y",
        beforeShowDay: unavailable
      }
    );
  })()
});
