
class PlayGame
    def initialize
        @player = 0
    end

    def start_game
        puts "A four combination by six different color, 12 rounds to play."
        puts "Who to solve puzzle? input 1 for you, 2 for computer."
        @player = gets.chomp.to_i

        if @player == 1
            puts "1"
        elsif @player == 2
            puts "2"
        else
            start_game
        end
    end
end



    

    