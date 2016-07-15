    $(function(){
       if($.cookie){
           //By default, if no cookie, just display.
           $("#newpost").toggle(!(!!$.cookie("toggle-state")) || $.cookie("toggle-state") === 'true');
    }
    $('#hideshow').on('click', function(){
        $("#newpost").toggle();
        //Save the value to the cookie for 1 day; and cookie domain is whole site, if ignore "path", it will save this cookie for current page only;
        $.cookie("toggle-state", $("#newpost").is(':visible'), {expires: 1, path:'/'});
});
});