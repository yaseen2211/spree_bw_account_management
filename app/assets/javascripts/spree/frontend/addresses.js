
$(document).on("change", "#bcountry select", function(e) {
  Spree.updateState('b')
})

$(document).on("change", "#address_country_id", function(e) {
  $("[id='bcountry']").not($(this).closest('p')).each(function(){
   $(this).attr("id", "");
  });

  $(this).closest('p').attr("id", "bcountry");


  $("[id='bstate']").not($(this).closest('p')).each(function(){
   $(this).attr("id", "");
  });

  $("#bcountry").next('p').attr("id", "bstate");

 });







