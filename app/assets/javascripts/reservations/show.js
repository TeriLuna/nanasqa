$( document ).ready(function() {
  (function(){
    $(".js-pay-buttom").on("click", function(elem){
      console.log("test")
      $(".mercadopago-button").trigger("click");
    });
  })()
});
