jQuery(function($){
    $('#searchtext').focus(function () {
        $(this).addClass('focus');
    });
    $('#searchtext').blur(function () {
        $(this).removeClass('focus');
    });

    $('#megaDropDownCtrl').click(function () {
        $('#megaDropDownMenu').fadeToggle(200);
    });

    $(document).click(function (e) {
        if ($(e.target).closest('#megaDropDownCtrl').length === 0 && $(e.target).closest('#megaDropDownMenu').length === 0) {
            $('#megaDropDownMenu').fadeOut(200);
        }
    });
});

