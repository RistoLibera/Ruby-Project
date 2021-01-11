require_relative "display.rb"
require_relative "game-logic.rb"

class ComputerSolver
    include Display
    include GameLogic

    def initialize
        @puzzle = []
        @input = []
    end
    
    def computer_guess
        puts "Please input your puzzle"
        @puzzle = get_input()


        uniq
        #  first stage guess until getting all the color
        #
        



    end

end

computer = ComputerSolver.new
computer.computer_guess
