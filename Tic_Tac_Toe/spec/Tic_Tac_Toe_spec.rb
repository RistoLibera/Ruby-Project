require_relative "../lib/Tic_Tac_Toe.rb"

describe TicTacToe do
    subject(:game){described_class.new}
    describe "#player_move" do
        it "updates board" do
            game.instance_variable_set(:@round_played, 1)
            game.player_move(0)
            board = game.instance_variable_get(:@board)[0]
            expect(board).to eql("O")
        end
    end
    
end
