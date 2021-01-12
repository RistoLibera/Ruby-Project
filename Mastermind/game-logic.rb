
module GameLogic
    def get_input
        input = gets.chomp
        return input.split("") if input.to_i.between?(1111, 6666)
        puts "Four Number!"
        get_input() 
    end

    def all_fits(puzzle_array,guess_array)
        all_fits = 0
        i = 0
        until i == 4 do
            all_fits += 1 if puzzle_array[i] == guess_array[i]
            i += 1
        end
        return all_fits
    end

    def color_fits(puzzle_array,guess_array)
        puzzle_array = puzzle_array.sort
        unfits = puzzle_array.length
        guess_array = guess_array.sort
        color_fits = 0
        i = 0

        until i == 4 do
            j = 0
            until j == unfits do
                puzzle_array.delete_at(j) if guess_array[i] == puzzle_array[j]
                j += 1
            end
            unfits = puzzle_array.length
            i += 1
        end
        color_fits = 4 - unfits
    end

    def result_check(puzzle_array, guess_array,counter)
        all_fits = all_fits(puzzle_array, guess_array)
        if all_fits == 4 && counter <= 12
            puts "We have a winner!"
            puts ""
            return "win before 12"
        elsif counter == 11
            puts "This is the final guess"
            puts ""
        elsif counter == 12
            puts "Game Over!"
            puts ""
        else
            puts "Please keep trying!"
            puts ""
        end
    end

    def new_game?
        puts "Want another round? Please input 1 to play again, others to exit"
        input = gets.chomp.to_i
        return "again" if input == 1
    end

    # Computer logic

    
end




