
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

    def guess_output(guess_array)
        guess_array.each do |num|
            print puzzle_color(num)
        end
    end

    def clue_output(puzzle_array,guess_array)
        clue_number = clue_check(puzzle_array,guess_array)
        print "  Clues:  "
        clue_number[0].times { print clue_color("all fits") }
        (clue_number[1] - clue_number[0]).times { print clue_color("color fits") }
        puts ""
        puts ""
    end

    
end




