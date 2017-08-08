jQuery(document).ready(function () {

    var wow = new WOW().init();
    var smooth = new SmoothScroll('a[href*="#"]');

    if (jQuery('#g-navigation').css('position') === 'fixed'){
        jQuery(window).scroll(function () {
            if (jQuery(this).scrollTop() > 200) {
                jQuery('#g-navigation').fadeIn(500);
            } else {
                jQuery('#g-navigation').fadeOut(500);
            }
        });
    }
});