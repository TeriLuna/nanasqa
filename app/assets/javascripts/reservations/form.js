$( document ).ready(function() {
  (function(){
    $(document).on("change", "input.js-quantity",function(){
      var roomPricePerPerson = $(".js-room-price-per-person").val();
      var quantity = $(this).val();
      var payButtom = $(".js-pay-buttom");
      var total = roomPricePerPerson * quantity;
      var format_total = payButtom.data("text").replace("_total_", "$" + total)
      payButtom.prop("value", format_total);

    })

    var datePickerContainer = $(".js-datepicker-conteiner")
    var start_date = null;
    var end_date = null;
    var unavailableDates = [];
    $.each(datePickerContainer.data("unavailables-dates"), function(i, elem){
      start_date  = elem[0];
      end_date    = elem[1];

      for (var d = new Date(start_date.split("-")[2], start_date.split("-")[1] - 1, start_date.split("-")[0] - 1); d <= new Date(end_date.split("-")[2], (parseInt(end_date.split("-")[1]) - 1), end_date.split("-")[0] - 1); d.setDate(d.getDate() + 1)) {
        d = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
        d = new Date(d)
        unavailableDates.push(d);
      }
    });

    // var start_date = $(".js-datepicker-conteiner").data("unavailables-dates")[0];
    // var end_date = $(".js-datepicker-conteiner").data("unavailables-dates")[1];

    var unavailable = function (date) {
      dmy = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
      unavailableDatesString = []

      $.each(unavailableDates, function(i, date){
        var date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
        unavailableDatesString.push(date)
      })

      if ($.inArray(dmy, unavailableDatesString) == -1) {
        return [true, ""];
      } else {
        return [false, "", "Booked"];
      }
    }

    var updateInputDates = function(startDate, endDate){
      if($("#js-datepicker-id").val()){
        var dateRangeVal = $("#js-datepicker-id").val().split("to")
        var startDate = $(".js-start-date").val(dateRangeVal[0].trim())
        var endDate = $(".js-end-date").val(dateRangeVal[1].trim())
      }
    }

    $("#js-datepicker-id").dateRangePicker(
      {
        format: "DD/MM/Y",
        dateFormat: "DD/MM/Y",
        beforeShowDay: unavailable
      }
    ).bind('datepicker-close', updateInputDates);

  })()
});
