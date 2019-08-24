// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'
$(document).ready(function()
{
    var navItems = $('.admin-menu li > a');
    var navListItems = $('.admin-menu li');
    var allWells = $('.admin-content');
    var allWellsExceptFirst = $('.admin-content:not(:first)');
    
    allWellsExceptFirst.hide();
    navItems.click(function(e)
    {
        e.preventDefault();
        navListItems.removeClass('active');
        $(this).closest('li').addClass('active');
        
        allWells.hide();
        var target = $(this).attr('data-target-id');
        $('#' + target).show();
    });

    //$("#address-info-sec").fadeTo(2000, 500).slideUp(500, function(){
    //$("#address-info-sec").slideUp(500);
    //});

    $('body').on("click", ".js-add-new-address-btn", function(e) {
      $('html, body').animate({
          scrollTop: $("#checkout_form_address").offset().top
      }, 2000);
    });



});


$(document).on("change", "#user-profile-image", function(e) {
  var filename = $('#File').val();
  $('#file-name').html(filename);
});
$(document).ready(function () {
    $('#user-profile-image').on("click",function () {
        $( "#bb" ).trigger( "click" );
        return false;
    });
})
$(document).on("change", "#File", function(e) {
    var filename = $('#File').val().replace('\\fakepath\\','');
    $('#file-name').html(filename);
});