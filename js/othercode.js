jQuery(document).ready(function () {

    resizeBackground();

    jQuery('a[href^="#"]').on('click', function (e) {
        e.preventDefault();

        var target = this.hash;
        var ID = jQuery(this).attr("id");

        if (ID !== "g-totop") {

            if (!target) {
                target = ".site";
            }

            var $target = jQuery(target);
            jQuery('html, body').stop().animate({'scrollTop': $target.offset().top}, 600, 'linear', function () {
                if (target !== ".site") {
                    window.location.hash = target;
                }
            });
        }
    });

    var wow = new WOW().init();

    if (jQuery('#g-navigation').css('position') === 'fixed') {
        jQuery(window).scroll(function () {
            if (jQuery(this).scrollTop() > 200) {
                jQuery('#g-navigation').fadeIn(500);
            } else {
                jQuery('#g-navigation').fadeOut(500);
            }
        });
    }
});

jQuery(window).resize(function () {
    resizeBackground();
});

function resizeBackground() {
    var fullScreen = jQuery('.full-screen');
    fullScreen.css('width', jQuery(window).width());
    fullScreen.css('height', jQuery(window).height());
}