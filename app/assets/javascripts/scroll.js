$(document).ready(function() {
    $(window).scroll(function() {
        if($(this).scrollTop() > 100){
            $('#goTop').stop().animate({
                bottom: '20px'    
                }, 1500);
        }
        else{
            $('#goTop').stop().animate({
               bottom: '20px'    
            }, 1500);
        }
    });
    $('#goTop').click(function() {
        $('html, body').stop().animate({
           scrollTop: 0
        }, 500, function() {
           $('#goTop').stop().animate({
               bottom: '20px'    
           }, 1500);
        });
    });
});    
