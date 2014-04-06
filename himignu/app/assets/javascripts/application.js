// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs


function display_sub_menu(year){
  var my_self = $("ul.child#"+year)
  if(my_self.is(':hidden')){
    $(my_self).show("slow");
  }else{
    $('ul.child').hide("slow");
  }
  $('ul.child').not(my_self).hide("slow");
  
}

function choose_popular_event(permalink){
  var url = "/admin/events/" + permalink + "/set_popular_event";

  $.ajax({
         type: "GET",
         url: url,
         beforeSend : function(){
          $(".radio").prop('disabled', true);
         },
         success: function(){
          $(".radio").prop('disabled', false);
         }
       });

  return false; // avoid to execute the actual submit of the form.
}