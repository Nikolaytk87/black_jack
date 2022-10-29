# frozen_string_literal: true

# Module for calculating and displaying game results
module Calculating
  def calculating
    if player_lost?
      action_player_lost
    elsif player_win?
      action_player_win
    elsif tie
      action_tie
    end
    self.bank = 0
  end

  protected

  def player_win?
    player.diff < dealer.diff || dealer.diff.negative?
  end

  def player_lost?
    player.diff.negative? || (player.diff > dealer.diff && !dealer.diff.negative?)
  end

  def tie
    player.score == dealer.score
  end

  def action_player_lost
    dealer.bank += bank
    puts "Alas,#{player.name} you lost"
  end

  def action_player_win
    player.bank += bank
    puts "Congratulations, #{player.name} you won"
  end

  def action_tie
    puts 'Tie. Number of points equal'
    split_users_bank
  end
end
