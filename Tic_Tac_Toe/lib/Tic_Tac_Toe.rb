class TicTacToe
##
    def initialize
        puts " Let's play Tic-Tac-Toe!"
        @board = ["1" , "2", "3", "4", "5", "6", "7", "8", "9"]
        @round_played = 0
    end

    def display_board
        puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-------------"
        puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-------------"
        puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    WinCondition = [[0, 1, 2], [3, 4 ,5], [6, 7, 8],
                    [0, 4, 8], [2, 4, 6], [0, 3, 6],
                    [1, 4, 7], [2, 5, 8]
                ]
    
    def player_move(input)
        if @round_played % 2 == 0
            @board[input] = "X"
        else
            @board[input] = "O"
        end

    end

    def empty_position?(input)
        if @board[input] == "X" || @board[input] == "O"
            return false
        else
            return true
        end
    end

    def win?
        WinCondition.detect do |condition|
            @board[condition[0]] == @board[condition[1]] &&
            @board[condition[1]] == @board[condition[2]] &&
            !(empty_position?(condition[0]))
        end
    end

    def play_round
        display_board
        puts "please input 1 to 9."
        input = gets.chomp.to_i - 1

        if input.between?(0, 8) && empty_position?(input)
            player_move(input)
            @round_played += 1
        else
            play_round
        end

        if @round_played < 9 && win?
            puts "winner is here!"
            display_board
        elsif @round_player == 9
            puts "This is a draw"
            display_board
        else
            play_round
        end
    end
end


# play_game = TicTacToe.new
# play_game.play_round

