class DataEntryController < ApplicationController
  def index
  
  end
 
  def create_game
    render :layout => false

    if params[:date_of_game] != nil
      game = Game.new

      game.season_id = params[:season_id]
      game.date_of_game = params[:date_of_game]
      game.away_name = params[:away_name]
      game.home_name = params[:home_name]
      game.away_hits = params[:away_hits]
      game.home_hits = params[:home_hits]
      game.away_errors = params[:away_errors]
      game.home_errors = params[:home_errors]
      game.top_first = params[:top_first]
      game.bottom_first = params[:bottom_first]
      game.top_second = params[:top_second]
      game.bottom_second = params[:bottom_second]
      game.top_third = params[:top_third]
      game.bottom_third = params[:bottom_third]
      game.top_fourth = params[:top_fourth]
      game.bottom_fourth = params[:bottom_fourth]
      game.top_fifth = params[:top_fifth]
      game.bottom_fifth = params[:bottom_fifth]
      game.top_sixth = params[:top_sixth]
      game.bottom_sixth = params[:bottom_sixth]
      game.top_seventh = params[:top_seventh]
      game.bottom_seventh = params[:bottom_seventh]
      game.top_eighth = params[:top_eighth]
      game.bottom_eighth = params[:bottom_eighth]
      game.top_ninth = params[:top_ninth]
      game.bottom_ninth = params[:bottom_ninth]
      game.top_tenth = params[:top_tenth]
      game.bottom_tenth = params[:bottom_tenth]
      
      if params[:outcome_win] != nil
        game.win = 1
      end

      if params[:outcome_loss] != nil
        game.loss = 1
      end

      if params[:outcome_tie] != nil
        game.tie = 1
      end

      if params[:winning_pitcher] != "None"
        game.winning_pitcher = params[:winning_pitcher]
      end

      if params[:losing_pitcher] != "None"
        game.losing_pitcher = params[:losing_pitcher]
      end

      if params[:saving_pitcher] != "None"
        game.saving_pitcher = params[:saving_pitcher]
      end

      game.save 
    end
  end

  def create_player
    render :layout => false

    if params[:name] != nil
      player = Player.new

      player.jersey_number = params[:jersey_number]
      player.name = params[:name]
      player.bats = params[:bats]
      player.throws = params[:throws]

      player.save
    end
  end

  def create_off_stats
    render :layout => false

    if params[:plate_appearances] != nil
      offstat = Offstat.new

      offstat.player_id = params[:player_id]
      offstat.season_id = params[:season_id]
      offstat.game_id = params[:game_id]
      offstat.plate_appearances = params[:plate_appearances]
      offstat.at_bats = params[:at_bats]
      offstat.runs = params[:runs]
      offstat.hits = params[:hits]
      offstat.singles = params[:singles]
      offstat.doubles = params[:doubles]
      offstat.triples = params[:triples]
      offstat.homeruns = params[:homeruns]
      offstat.rbis = params[:rbis]
      offstat.walks = params[:walks]
      offstat.hit_by_pitches = params[:hit_by_pitches]
      offstat.strikeouts = params[:strikeouts]
      offstat.stolen_bases = params[:stolen_bases]
      offstat.caught_stealings = params[:caught_stealings]

      offstat.save
    end
  end

  def create_pit_stats
    render :layout => false

    if params[:player_id] != nil
      pitstat = Pitstat.new

      pitstat.player_id = params[:player_id]
      pitstat.season_id = params[:season_id]
      pitstat.game_id = params[:game_id]
      pitstat.outs_recorded = params[:outs_recorded]
      pitstat.hits = params[:hits]
      pitstat.runs = params[:runs]
      pitstat.earned_runs = params[:earned_runs]
      pitstat.walks = params[:walks]
      pitstat.strikeouts = params[:strikeouts]
      pitstat.homeruns = params[:homeruns]
      
      if params[:win_game] != nil
        pitstat.win_game = 1
      end

      if params[:loss_game] != nil
        pitstat.loss_game = 1
      end

      if params[:save_game] != nil
        pitstat.save_game = 1
      end

      pitstat.save
    end
  end

  def create_season
    render :layout => false

    if params[:name] != nil
      season = Season.new

      season.name = params[:name]
      season.start_date = params[:start_date]
      season.end_date = params[:end_date]

      season.save
    end
  end

  def create_participation
    render :layout => false

    participation = Participation.new

    participation.player_id = params[:player_id]
    participation.season_id = Season.last.id 

    participation.save
  end
end
