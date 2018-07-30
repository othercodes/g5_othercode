jQuery(document).ready(function () {

    jQuery('.full-screen').height(jQuery(window).height());

    jQuery(window).resize(function () {
        jQuery('.full-screen').height(jQuery(window).height());
    });

    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {

    } else {
        jQuery(window).enllax();
    }

    jQuery('a[href^="#"]').on('click', function (e) {
        e.preventDefault();

        var target = this.hash;
        var ID = jQuery(this).attr("id");

        if (ID !== "g-totop") {

            if (!target) {
                target = ".site";
            }

            var $target = jQuery(target);
            jQuery('html, body').stop().animate({'scrollTop': $target.offset().top}, 600, 'swing', function () {
                if (target !== ".site") {
                    window.location.hash = target;
                }
            });
        }
    });

    new WOW({
        mobile: false
    }).init();

    if (jQuery('#g-navigation').css('position') === 'fixed') {
        jQuery(window).scroll(function () {
            if (jQuery(this).scrollTop() > (jQuery(window).height() - 100)) {
                jQuery('#g-navigation').fadeIn(500);
            } else {
                jQuery('#g-navigation').fadeOut(500);
            }
        });
    }
});

