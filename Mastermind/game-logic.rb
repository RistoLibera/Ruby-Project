
module GameLogic
    def get_input
        input = gets.chomp
        return input.to_s.split("") if input.to_i.between?(1111, 6666)
        puts "Four Number!"
        get_input() 
    end

    def clue_check(puzzle_array,guess_array)
        all_fits = 0
        color_fits = 0
        i = 0
        until i == 4 do
            all_fits += 1 if puzzle_array[i] == guess_array[i]
            color_fits += 1 if puzzle_array.sort[i] == guess_array.sort[i]
            i += 1
        end
        return [all_fits, color_fits]
    end

    def result_check(puzzle_array, guess_array,counter)
        the_fits = clue_check(puzzle_array, guess_array)
        all_fits = the_fits[0]

        if all_fits == 4 && counter <= 12
            puts "We have a winner!"
            return "win before 12"
        elsif counter == 11
            puts "This is the final guess"
        elsif counter == 12
            puts "Game Over!"
        else
            puts "Please keep trying!"
        end
    end

    def new_game?
        puts "Want another round? Please input 1 to play again, others to exit"
        input = gets.chomp.to_i
        return "again" if input == 1
    end
end