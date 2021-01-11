require_relative "display.rb"
require_relative "game-logic.rb"

class HumanSolver
    include Display
    include GameLogic

    def initialize
        @puzzle = [6, 4, 3, 1]
        # @puzzle = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
        @puzzle = @puzzle.map { |i| i.to_s}
        @human_guess = []
    end
    
    def human_guess
        puts "Please input FOUR numbers from 1 to 6 for a start guess"
        @counter = 1

        until @counter > 12 do
            @human_guess = get_input()
            puts ""
            puts "Turn #{@counter}"
            puts ""
            guess_output(@human_guess)
            clue_output(@puzzle, @human_guess)
            break if result_check(@puzzle, @human_guess, @counter) == "win before 12"
            @counter += 1
        end
    end
end


human =HumanSolver.new
human.human_guess
