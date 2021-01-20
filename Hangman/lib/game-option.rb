require_relative "hangman.rb"

class Game
    include Hangman
    def initialize
        @keyword = get_keywords()
        @tip = generate_tip(@keyword)
        @input = ""
        puts "Welcome to be a hangman!"
    end

    def input_check()
        @input = gets.chomp.downcase 
        if @input.length == 1 && @input.ord >= 97 && @input.ord <= 122
           compare(@input,@keyword,@tip)
        else 
            puts "One character!"
            input_check()
        end
    end

    def game_start
        puts "Please input your first character."
        input_check()
        print @tip.join(" ")

    end


end

gamee = Game.new
gamee.game_start
