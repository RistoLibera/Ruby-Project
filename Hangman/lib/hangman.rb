

module Hangman
    def get_keywords
        dictionary = File.read("5desk.txt")
        words = []
        dictionary.each_line do |word|
            word = word.chomp
            if word.length.between?(6,12)
                words << word
            else
                next
            end
        end
        return words.sample.split("")
    end

    def generate_tip(keyword)
        tip = []
        tip_length = keyword.length
        tip_length.times { tip << "_" }
        return tip
    end

    def compare(input,keyword,tip)
        length = keyword.length
        i = 0
        until i == length do
            tip[i] = input if keyword[i] == input
            i += 1
        end
    end
    
end

