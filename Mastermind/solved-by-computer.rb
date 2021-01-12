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
        @impossible_array = []
    end
    
    def computer_guess
        puts "Please input your puzzle"
        @puzzle = get_input()
        start_guess()

    end

    def start_guess
        numbers = [1, 2, 3, 4, 5, 6].shuffle.map { |num| num.to_s}
        @com_input = start_color(numbers)
    end

    def start_color(numbers, index = 0, guess_array = [])
        guess_array << numbers[index] until guess_array.length == 4
        all_fits = all_fits(@puzzle, guess_array)
        color_fits = color_fits(@puzzle, guess_array)

        guess_array.pop(4 - color_fits)
        @counter += 1
        return guess_array if color_fits == 4
        start_color(numbers, index + 1, guess_array)
    end

    def start_impossibility(all_fits, color_fits)
        


end

computer = ComputerSolver.new
computer.computer_guess
