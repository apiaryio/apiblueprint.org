//= require_tree .
$(function() {
    $(document).on("click",".tool", function(){
       var url = $(this).find('a').attr('href'); 
       window.location = url;
    });
});