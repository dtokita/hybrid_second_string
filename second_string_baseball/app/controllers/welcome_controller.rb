class WelcomeController < ApplicationController
  def index

  end

  def home
    render :layout => false
  end

  def roster
    render :layout => false
  end

  def statistics
    render :layout => false
  end 

  def gallery
    render :layout => false
  end

  def all_time_leaders
 
    @offstats = Offstat.all
    @pitstats = Pitstat.all
    @players  = Player.all

    @batting_avgs = Array.new
    @obps = Array.new
    @slugging_pcts = Array.new
    @opss = Array.new
    @hits = Array.new
    @runs = Array.new
    @rbis = Array.new
    @walks = Array.new
    @singles = Array.new
    @doubles = Array.new
    @triples = Array.new
    @homeruns = Array.new
    @steals = Array.new
    @strikeouts = Array.new
    @games_played = Array.new

    @outs_recorded = Array.new
    @p_strikeouts = Array.new
    @era = Array.new
    @whip = Array.new
    @wins = Array.new
    @saves = Array.new
    @loss = Array.new 

    @players.each do |player|
      player_off_stats = @offstats.where(player_id: player.id)
      player_pit_stats = @pitstats.where(player_id: player.id)

      if (player_off_stats.sum(:plate_appearances) != 0)
        @batting_avgs.push([ player_off_stats.sum(:hits) / player_off_stats.sum(:at_bats), player.id])
        @obps.push( [(player_off_stats.sum(:hits) + player_off_stats.sum(:walks)) / player_off_stats.sum(:plate_appearances), player.id])
        @slugging_pcts.push([((player_off_stats.sum(:singles) + player_off_stats.sum(:doubles) * 2.0 + player_off_stats.sum(:triples) * 3.0 + player_off_stats.sum(:homeruns) * 4.0 )  / ( player_off_stats.sum(:at_bats))), player.id])
        @opss.push([((player_off_stats.sum(:hits) + player_off_stats.sum(:walks)) / (player_off_stats.sum(:plate_appearances))) + ((player_off_stats.sum(:singles) + player_off_stats.sum(:doubles) * 2.0 + player_off_stats.sum(:triples) * 3.0 + player_off_stats.sum(:homeruns) * 4.0 ) / (player_off_stats.sum(:at_bats))), player.id]) 
        @hits.push([ player_off_stats.sum(:hits), player.id])
        @runs.push([ player_off_stats.sum(:runs), player.id])
        @rbis.push([ player_off_stats.sum(:rbis), player.id])
        @walks.push([ player_off_stats.sum(:walks), player.id])
        @singles.push([ player_off_stats.sum(:singles), player.id])
        @doubles.push([ player_off_stats.sum(:doubles), player.id])
        @triples.push([ player_off_stats.sum(:triples), player.id])
        @homeruns.push([ player_off_stats.sum(:homeruns), player.id])
        @steals.push([ player_off_stats.sum(:stolen_bases), player.id])
        @strikeouts.push([ player_off_stats.sum(:strikeouts), player.id])
        @games_played.push([ player_off_stats.count, player.id])
      end

      if (player_pit_stats.sum(:outs_recorded) != 0)
        @outs_recorded.push([ player_pit_stats.sum(:outs_recorded), player.id ])
        @p_strikeouts.push([ player_pit_stats.sum(:strikeouts), player.id ])
        @era.push([ player_pit_stats.sum(:earned_runs) * 27.0 / player_pit_stats.sum(:outs_recorded), player.id])
        @whip.push([ (player_pit_stats.sum(:walks) + player_pit_stats.sum(:hits)) / (player_pit_stats.sum(:outs_recorded) / 3.0) , player.id ])
        @wins.push([ player_pit_stats.sum(:win_game), player.id])
        @saves.push([ player_pit_stats.sum(:save_game), player.id])
        @loss.push([ player_pit_stats.sum(:loss_game), player.id])
      end
    end

    @batting_avgs.sort! { |x,y| y[0] <=> x[0] }
    @obps.sort! { |x,y| y[0] <=> x[0] }
    @slugging_pcts.sort! { |x,y| y[0] <=> x[0] }   
    @opss.sort! { |x,y| y[0] <=> x[0] } 
    @hits.sort! { |x,y| y[0] <=> x[0] }
    @runs.sort! { |x,y| y[0] <=> x[0] }
    @rbis.sort! { |x,y| y[0] <=> x[0] }
    @walks.sort! { |x,y| y[0] <=> x[0] }
    @singles.sort! { |x,y| y[0] <=> x[0] }
    @doubles.sort! { |x,y| y[0] <=> x[0] }
    @triples.sort! { |x,y| y[0] <=> x[0] }
    @homeruns.sort! { |x,y| y[0] <=> x[0] }
    @steals.sort! { |x,y| y[0] <=> x[0] }
    @strikeouts.sort! { |x,y| y[0] <=> x[0] }
    @games_played.sort! { |x,y| y[0] <=> x[0] }
    @outs_recorded.sort! { |x,y| y[0] <=> x[0] }
    @p_strikeouts.sort! { |x,y| y[0] <=> x[0] }
    @era.sort! { |x,y| x[0] <=> y[0] }
    @whip.sort! { |x,y| x[0] <=> y[0] }
    @wins.sort! { |x,y| y[0] <=> x[0] }
    @saves.sort! { |x,y| y[0] <=> x[0] }
    @loss.sort! { |x,y| y[0] <=> x[0] } 

    render :layout => false 

  end

  def player_stats
    render :layout => false
  end

  def games_stats
    render :layout => false
  end
end
