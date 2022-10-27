module Inputs
  def input_player_name
    puts 'Input your name: '
    gets.chomp
  end

  def input_player_choice
    puts "Enter 1 if you want to skip a turn\n" \
         "Enter 2 if you want to add a card\n" \
         'Enter 3 if you want to open cards'
    gets.chomp
  end

  def input_continue
    puts "Enter 1 if you want to play again\n" \
         'Enter 0 if you want exit'
    gets.chomp
  end
end
