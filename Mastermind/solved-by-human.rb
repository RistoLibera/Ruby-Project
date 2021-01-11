require_relative "display.rb"
require_relative "game-logic.rb"

class HumanSolver
    include Display
    include GameLogic

    def initialize
        @puzzle = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
        @puzzle = @puzzle.map { |i| i.to_s}
        @input = []
    end
    
    def human_guess
        puts @puzzle
        puts "Please input FOUR numbers from 1 to 6 for a start guess"
        @counter = 1

        until @counter > 12 do
            @input = get_input()
            puts ""
            guess_output(@input)
            clue_output(@puzzle, @input)
            break if result_check(@puzzle, @input, @counter) == "win before 12"
            @counter += 1
        end
    end
end


human = HumanSolver.new
human.human_guess

