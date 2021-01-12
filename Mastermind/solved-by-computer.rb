require_relative "display.rb"
require_relative "game-logic.rb"
require "pry"

class ComputerSolver
    include Display
    include GameLogic

    attr_reader :com_input
    def initialize
        @puzzle = []
        @com_input = []
        @counter = 1
    end
    
    def computer_guess
        puts ""
        puts "Please input your puzzle"
        @puzzle = get_input()
        start_guess()
        continue_guess() unless all_fits(@puzzle,@com_input) == 4

    end

    def start_guess
        numbers = [1, 2, 3, 4, 5, 6].shuffle.map { |num| num.to_s}
        @com_input = start_color(numbers)
    end

    def start_color(numbers, index = 0, guess_array = [])
        guess_array << numbers[index] until guess_array.length == 4
        color_fits = color_fits(@puzzle, guess_array)
        guess_output(guess_array, @counter)
        clue_output(@puzzle, guess_array)
        guess_array.pop(4 - color_fits)
        return guess_array if result_check(@puzzle, guess_array, @counter) == "win before 12"
        return guess_array if color_fits == 4
        @counter += 1
        sleep(1)
        start_color(numbers, index + 1, guess_array)
    end

    def continue_guess
        com_mind = @com_input.permutation.to_a.uniq
        p com_mind
        until @counter > 12 do
            this_guess = com_mind.sample
            guess_output(this_guess, @counter)
            clue_output(@puzzle, this_guess)
            break if result_check(@puzzle, this_guess, @counter) == "win before 12"
            sleep(1)
            com_mind.delete(this_guess) unless all_fits(@puzzle,this_guess) == 4
            @counter += 1
        end
    end

    




end


