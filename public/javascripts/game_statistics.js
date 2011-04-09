$(document).ready(function(){
  $(".clickable").bind("click", function() {
    var form = $(".edit_player_game_statistic");

    $('<input>').attr({
      type: 'hidden',
      name: 'field',
      value: $(this).attr("id")
     }).appendTo(form);

    form.submit();
  });
});




