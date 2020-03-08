$('.play-pause').click(function(){
    if (!$(this).hasClass('play')) {
        $(this).attr('src', '/images/template/play.png');
        $(this).addClass('play')
        $('.cycle-slideshow').cycle('pause');   
    } else  {
        $(this).attr('src', '/images/template/pause.png');
        $(this).removeClass('play')
        $('.cycle-slideshow').cycle('resume');
    }
});
