$(document).ready(function() {
    "use strict";
    $(function(){
        $('#menu').slicknav();
    });
    document.addEventListener("touchstart", function(){}, true);
    $(window).load(function() {
        "use strict";
        $(".loader").fadeOut("slow");
        $('.portfolio-masonry').isotope({
            itemSelector: '.selector'
        });
        $(function() {
            var $container = $('.portfolio-masonry').isotope({
                itemSelector: '.item'
            });
            var filterFns = {
                numberGreaterThan50: function() {
                    var number = $(this).find('.number').text();
                    return parseInt(number, 10) > 50;
                },
                ium: function() {
                    var name = $(this).find('.name').text();
                    return name.match(/ium$/);
                }
            };
            $('#filters').on('click', 'li', function() {
                var filterValue = $(this).attr('data-filter');
                filterValue = filterFns[filterValue] || filterValue;
                $container.isotope({
                    filter: filterValue
                });
            });
            $('.filters').each(function(i, buttonGroup) {
                var $buttonGroup = $(buttonGroup);
                $buttonGroup.on('click', 'li', function() {
                    $buttonGroup.find('.active').removeClass('active');
                    $(this).addClass('active');
                });
            });
        });
    });
});

jQuery(document).ready(function($) {  

// site preloader -- also uncomment the div in the header and the css style for #preloader
$(window).load(function(){
	$('#preloader').fadeOut('slow',function(){$(this).remove();});
});

});
