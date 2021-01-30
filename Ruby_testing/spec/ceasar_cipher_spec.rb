require "./lib/ceasar-cipher.rb"



describe CaesarCipher do
    subject { CaesarCipher.new }

    describe "#translate" do
        it "work with small shift" do
            expect(subject.translate("Ant", 1)).to eql("Bou")
        end
    end

end
