$(document).ready(function(){
  var index = 1000;

  $("a.add_player").live("click", function(){
//    var element = $(event.target);
//    var form = $(".new_team");

//    player_attribute = $("li#team_players_attributes_"+index+"_first_name_input");

    var prefix = "team[players_attributes]["+index+"][first_name]";
    var input_element = $("<input/>", {name: prefix});
    var form = $("#players");

    console.log(form);
    console.log(input_element);

    form.append(input_element);
    index++;
//    $("li#team_players_attributes_"+index+"_last_name_input");
//    <li id="team_players_attributes_0_first_name_input" class="string optional">
//        <input id="team_players_attributes_0_first_name" type="text" name="team[players_attributes][0][first_name]" maxlength="255">
//    </li>
  });
});