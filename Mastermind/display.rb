
module Display
    def puzzle_color(number)
        {
            "1" => "\e[41m  1  \e[0m",
            "2" => "\e[42m  2  \e[0m",
            "3" => "\e[43m  3  \e[0m",
            "4" => "\e[44m  4  \e[0m",
            "5" => "\e[45m  5  \e[0m",
            "6" => "\e[46m  6  \e[0m",
        }[number]
    end

    def clue_color(condition)
        {
            "all fits" => " \e[91m\u{25CF}\e[0m ",
            "color fits" => " \e[97m\u{25CF}\e[0m "
        }[condition]
    end

    def guess_output(guess_array, counter)
        puts ""
        puts "Turn #{counter}"
        puts ""
        guess_array.each do |num|
            print puzzle_color(num)
        end
    end

    def clue_output(puzzle_array,guess_array)
        all_fits = all_fits(puzzle_array, guess_array)
        color_fits = color_fits(puzzle_array, guess_array)
        print "  Clues:  "
        all_fits.times { print clue_color("all fits") }
        (color_fits - all_fits).times { print clue_color("color fits") }
        puts ""
        puts ""
    end

    
end




