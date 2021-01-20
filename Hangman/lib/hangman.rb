

module Hangman

 
    def key_words
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

    def generate_tip
        tip = []
        tip_length = key_words().length
        tip_length.times { tip << "_" }
        return tip
    end


    

end

