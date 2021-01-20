require_relative "hangman.rb"

class Game
    include Hangman
    def initialize
        puts "Welcome to be a hangman!"
    end

    def compare(input,keyword)

    end

    def game_start
        puts "Please input your first character."
        input = gets.chomp.downcase

    end

    def play_game

    end

end