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
        turns = 1
        for i in 1..10
            if turns == 1
                puts "Please input your first character!"
                input_check()
                print @tip.join(" ")
            elsif turns < 11
                puts "Remaining #{10 - turns} chances to try!"
                input_check()
                print @tip.join(" ")
            else
                puts "Game Over!"
            end
            turns += 1
            break if !(@tip.include?("_"))

        end
        puts " Congratulation! You win!" if !(@tip.include?("_"))
    end
end

play = Game.new
play.game_start
