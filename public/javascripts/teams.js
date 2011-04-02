$(document).ready(function(){
  var index = 1000;

  $("a.add_player").live("click", function(){
//    var element = $(event.target);
//    var form = $(".new_team");

//    player_attribute = $("li#team_players_attributes_"+index+"_first_name_input");

    var first_name = "team[players_attributes]["+index+"][first_name]";
    var first_name_input_element = $("<input/>", {name: first_name});

    var last_name = "team[players_attributes]["+index+"][last_name]";
    var last_name_input_element = $("<input/>", {name: last_name});

    var number = "team[team_players_attributes]["+index+"][number]";
    var number_input_element = $("<input/>", {name: number});

    var form = $("#players");

    form.append("First Name, Last Name");
    form.append(first_name_input_element);
    form.append(last_name_input_element);
    form.append(number_input_element);
    form.append($("<br>"));
    index++;
  });
});