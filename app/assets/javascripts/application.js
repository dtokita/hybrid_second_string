// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require_tree .

var create_player = function () {
  var player_obj = {
    jersey_number: $('#jersey_number').val(),
    name: $('#name').val(),
    bats: $('#bats').val(),
    throws: $('#throws').val()
  };

  $.post('create_player', player_obj, function(data, status) {
    if ( status == "success")
      $('#player_success').show();
    else
      $('#player_failed').show();
  });
}

var create_season = function () {
  var season_obj = {
    name: $('#season-name').val(),
    start_date: $('#start-date').val(),
    end_date: $('#end-date').val()
  }

  var players = $('#players').val();

  $.post('create_season', season_obj, function(data, status) {
    if (status == "success")
      $('#season_success').show();
    else
      $('#season_failed').show();
  });

  for (var i = 0; i < players.length; i++) {
    $.post('create_participation', {player_id: players[i]});
  }

}

var create_game = function () {
  var game_obj = {
    season_id: $('#season').val(),
    date_of_game: $('#date-of-game').val(),
    away_name: $('#away-name').val(),
    home_name: $('#home-name').val(),
    away_hits: $('#away-hits').val(),
    home_hits: $('#home-hits').val(),
    away_errors: $('#away-errors').val(),
    home_errors: $('#home-errors').val(),
    top_first: $('#top-first').val(),
    bottom_first: $('#bottom-first').val(),
    top_second: $('#top-second').val(),
    bottom_second: $('#bottom-second').val(),
    top_third: $('#top-third').val(),
    bottom_third: $('#bottom-third').val(),
    top_fourth: $('#top-fourth').val(),
    bottom_fourth: $('#bottom-fourth').val(),
    top_fifth: $('#top-fifth').val(),
    bottom_fifth: $('#bottom-fifth').val(),
    top_sixth: $('#top-sixth').val(),
    bottom_sixth: $('#bottom-sixth').val(),
    top_seventh: $('#top-seventh').val(),
    bottom_seventh: $('#bottom-seventh').val(),
    top_eighth: $('#top-eighth').val(),
    bottom_eighth: $('#bottom-eighth').val(),
    top_ninth: $('#top-ninth').val(),
    bottom_ninth: $('#bottom-ninth').val(),
    top_tenth: $('#top-tenth').val(),
    bottom_tenth: $('#bottom-tenth').val(),
    outcome_win: $('#outcome-win:checked').val(),
    outcome_loss: $('#outcome-loss:checked').val(),
    outcome_tie: $('#outcome-tie:checked').val(),
    winning_pitcher: $('#winning-pitcher').val(),
    losing_pitcher: $('#losing-pitcher').val(),
    saving_pitcher: $('#saving-pitcher').val()
  }

  $.post('create_game', game_obj, function(data, status) {
    if (status == "success")
      $('#game_success').show();
    else
      $('#game_failed').show();
  });

}

var create_off_stat = function () {
  off_stat_obj = {
    player_id: $('#off-player').val(),
    season_id: $('#off-season').val(),
    game_id: $('#off-game').val(),
    plate_appearances: $('#plate-appearances').val(),
    at_bats: $('#at-bats').val(),
    runs: $('#runs').val(),
    hits: $('#hits').val(),
    singles: $('#singles').val(),
    doubles: $('#doubles').val(),
    triples: $('#triples').val(),
    homeruns: $('#homeruns').val(),
    rbis: $('#rbis').val(),
    walks: $('#walks').val(),
    hit_by_pitches: $('#hit-by-pitches').val(),
    strikeouts: $('#strikeouts').val(),
    stolen_bases: $('#stolen_bases').val(),
    caught_stealings: $('#caught_stealings').val()
  }

  $.post('create_off_stats', off_stat_obj, function(data, status) {
    if (status == "success")
      $('#off_stat_success').show()
    else
      $('#off_stat_failed').show()
  });
}

var create_pit_stat = function () {
  pit_stat_obj = {
    player_id: $('#pit-player').val(),
    season_id: $('#pit-season').val(),
    game_id: $('#pit-game').val(),
    outs_recorded: $('#outs-recorded').val(),
    hits: $('#hits-allowed').val(),
    runs: $('#runs-allowed').val(),
    earned_runs: $('#earned-runs').val(),
    walks: $('#walks-allowed').val(),
    strikeouts: $('#strikeouts-recorded').val(),
    homeruns: $('#homeruns-allowed').val(),
    win_game: $('#win-game:checked').val(),
    loss_game: $('#loss-game:checked').val(),
    save_game: $('#save-game:checked').val()
  }

  $.post('create_pit_stats', pit_stat_obj, function(data, status) {
    if (status == "success")
      $('#pit_stat_success').show()
    else
      $('#pit_stat_failed').show()
  });
}

var get_player_data = function () {
  var player_id = $('#player-stats').val();

  var player_modal = $('#player-modal');
  var player_spinner = $('#player-spinner');
  
  player_modal.show();

  $.get('welcome/player_stats', {player_id: player_id}, function(data, status) {
    if (status == "success") {
      player_spinner.hide();
      $('#player-modal-content').append(data);
      ons.notification.alert("Stats are best viewed in landscape mode!");
    } else {
      // Gracefully exit
    }
  });
}

var close_player_modal = function () {
  var player_modal = $('#player-modal');
 
  player_modal.hide();
}

var get_games_data = function () {
  var game_id = $('#game-stats').val();

  var game_modal = $('#games-modal');
  var game_spinner = $('#games-spinner');

  game_modal.show();

  $.get('welcome/games_stats', {game_id: game_id}, function(data, status) {
    if (status == "success") {
      game_spinner.hide();
      $('#games-modal-content').append(data);
      ons.notification.alert("Stats are best viewed in landscape mode!");
    } else {
      // Gracefully exit
    }
  });
}

var close_games_modal = function () {
  var games_modal = $('#games-modal');

  games_modal.hide();
}
