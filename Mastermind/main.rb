require_relative "display.rb"
require_relative "game-logic.rb"
require_relative "solved-by-computer"
require_relative "solved-by-human"

class PlayGame
    def initialize
        @player = 0
    end

    def start_game
        puts "A four combination by six different color, 12 rounds to play."
        puts ""
        puts "Who to solve puzzle? input 1 for you, 2 for computer."
        @player = gets.chomp.to_i

        if @player == 1
            human = HumanSolver.new
            human.human_guess            
        elsif @player == 2
            computer = ComputerSolver.new
            computer.computer_guess
        else
            start_game
        end
    end
end

play_game = PlayGame.new
play_game.start_game



    

    