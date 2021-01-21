require_relative "hangman.rb"
require "yaml"
class Game
    include Hangman
    def initialize
        @keyword = get_keywords()
        @tip = generate_tip(@keyword)
        @input = ""
        @turn = 1
        puts "Welcome to be a hangman!"
    end

    def start_option
        @input = gets.chomp.to_i
        if @input == 1
            puts "Let's play a new game!"
        elsif @input == 2
            filenames = Dir.glob("save/*")
            filenames.each do |filename| 
                puts filename.slice(5, filename.length)
            end
            puts "\nAll the saving is here."
            puts "Please input file's name."
            filename = "save/" + gets.chomp.to_s + ".yaml"
            old_game = YAML.load(File.read(filename))
            @keyword = old_game["keyword"]
            @tip = old_game["tip"]
            @input = old_game["input"]
            @turn = old_game["turn"]
        else
            puts "1 or 2 !"
            start_option()
        end

    end

    def input_check
        @input = gets.chomp.downcase 
        if @input.length == 1 && @input.ord >= 97 && @input.ord <= 122
           compare(@input,@keyword,@tip)
        elsif @input.to_i == 2
            save(@input)
        else 
            puts "One character!"
            input_check()
        end
    end

    def save(input)
        puts "Please input filename"
        filename = gets.chomp.to_s
        dump = YAML.dump({
            "keyword" => @keyword,
            "tip" => @tip,  
            "input" => @input, 
            "turn" => @turn 
        })
        if File.exist?("save/#{filename}.yaml")
            puts "Existed filename, unsuccessiful saving."
        else
            File.write(File.new("save/#{filename}.yaml", "w+"), dump)
            puts "Saved!"
        end
    end


    def game_start
        @turn = 1
        until @turn == 11 do
            if @turn == 1
                puts "Please decide whether to play new game or load old game"
                puts "1 for new game, 2 for old game"
                start_option()
                puts "Please input your first character! Or 2 to save now"
                input_check()
                puts @tip.join(" ")
            else 
                puts "\nRemaining #{10 - @turn} chances to try!"
                puts "Do you want to save? input 2 to confirm.\n\n"
                input_check()
                puts @tip.join(" ")
            end
            @turn += 1
            break if !(@tip.include?("_"))
        end
        puts "\nCongratulation! You win!" if !(@tip.include?("_"))
        puts "Game Over! The answer is #{@keyword.join("")}" if @tip.include?("_")
        puts "\nWant another round? 1 for another game"
        @input = gets.chomp.to_i
        game_start() if @input == 1
    end
end

play = Game.new
play.game_start
