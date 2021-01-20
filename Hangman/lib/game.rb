require_relative "hangman.rb"
require "yaml"
class Game
    include Hangman
    def initialize
        @keyword = get_keywords()
        @tip = generate_tip(@keyword)
        @input = ""
        puts "Welcome to be a hangman!"
    end

    def start_option
        @input = gets.chomp.to_i
        if @input == 1
            puts "Let's play a new game!"
        elsif @input == 2
            filenames = Dir.glob("#{Dir.pwd}/save/*")
            puts filenames
            puts "All the saving is here."
            puts "Please input file's name."
            filename = "#{Dir.pwd}/save/" + gets.chomp.to_s + ".yaml"
            old_game = YAML.load(filename)
            old_game
        else
            start_option()
        end

    end

    # def save
    # elsif @input == 2
    #     puts "Please input filename"
    #     filename = gets.chomp.to_s
    #     File.new("#{File.pwd}" + "/save/#{filename}" + "." )
    # File.new("#{Dir.pwd}/save/tt.txt", "w+")
    # end

    def input_check
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
                puts "Please decide whether to play new game or load old game"
                puts "1 for new game, 2 for old game"
                start_option()
                puts "Please input your first character!"
                input_check()
                puts @tip.join(" ")
            else 
                puts ""
                puts "Remaining #{10 - turns} chances to try!"
                input_check()
                puts @tip.join(" ")
            end
            turns += 1
            break if !(@tip.include?("_"))

        end
        puts ""
        puts " Congratulation! You win!" if !(@tip.include?("_"))
        puts "Game Over! The answer is #{@keyword.join("")}" if @tip.include?("_")
        puts ""
        puts "Want another round? 1 for new game 2 for oldgame"
    end
end

play = Game.new
play.game_start
