jQuery(document).ready(function(){
    jQuery('#hideshow').live('click', function(event) {
         jQuery('#newpost').toggle('show');
    });
});