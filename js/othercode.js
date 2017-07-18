jQuery(document).ready(function () {

    new WOW().init();

    var anchors = document.querySelectorAll('[href*="#"]');
    for (var i = 0, len = anchors.length; i < len; i++) {
        var url = new RegExp(window.location.hostname + window.location.pathname);
        if (!url.test(anchors[i].href)) continue;
        anchors[i].setAttribute('data-scroll', true);
    }
    
});