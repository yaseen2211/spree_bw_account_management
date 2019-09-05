
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



$(document).on("change", ".js-profile-address-counyty-drop", function(e) {
	let profileAddressId = $(this).parent().attr('data_profile_address_id');
	let selectedValue    = $(this).val();

	let uae_state  			= $(".js-" + profileAddressId + "-uae-state");
	let uae_suburb 			= $(".js-"	 + profileAddressId + "-uae-suburb");
	let non_uae_state 	= $(".js-" + profileAddressId + "-non-uae-state");
	let non_uae_suburb 	= $(".js-" + profileAddressId + "-non-uae-suburb");
	let default_address_id = parseInt($(".js-default-address-id").attr("data_default_address_id"))

	if (selectedValue == default_address_id){
		uae_state.removeClass("hide");
		uae_suburb.removeClass("hide");
		non_uae_state.addClass("hide");
		non_uae_suburb.addClass("hide")

		uae_state.children('input').attr("required", true);
		uae_suburb.children('input').attr("required", true);
		non_uae_state.children('input').removeAttr('required')
		non_uae_suburb.children('input').removeAttr('required')


	}else{
		uae_state.addClass("hide");
		uae_suburb.addClass("hide");
		non_uae_state.removeClass("hide");
		non_uae_suburb.removeClass("hide")

		non_uae_state.children('input').attr("required", true);
		non_uae_suburb.children('input').attr("required", true);
		uae_state.children('input').removeAttr('required')
		uae_suburb.children('input').removeAttr('required')

	}
});

