$(document).ready(function(){
  $(".clickable").bind("click", function() {
  //  this.attr("id").val()
//    console.log($(this).attr("id"));

    var form = $(".edit_player_game_statistic");

    $('<input>').attr({
      type: 'hidden',
      name: 'field',
      value: $(this).attr("id")
     }).appendTo(form);

    form.submit();

    $.getJSON(form.attr("action"),
      function(new_stats){
        var stats = new_stats["player_game_statistic"];
        $("#fgm-fga").text(stats["fgm"]+" / "+stats["fga"]);
        $("#ftm-fta").text(stats["ftm"]+" / "+stats["fta"]);
        $("#tpm-tpa").text(stats["tpm"]+" / "+stats["tpa"]);
        $("#orb-drb").text(stats["orb"]+" / "+stats["drb"]);
        $("#ast-to").text(stats["ast"]+" / "+stats["to"]);
        $("#s-pf").text(stats["s"]+" / "+stats["pf"]);
      });

  });
});




