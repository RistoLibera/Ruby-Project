
class Knight
    attr_accessor :position, :ending, :parent
    
    @@history = []
    def initialize(position, ending, parent = nil)
        @position = position
        @ending = ending
        @parent = parent
        @@history.push(position)
        @moves = [
            [-1, -2], [1, 2], [-1, 2], [1, -2],
             [-2, -1], [2, 1], [-2, 1], [2, -1]
          ]
    end

    def get_next_positions
        next_positions = @moves.map { |move| [@position[0] + move[0], @position[1] + move[1]] }
                                .select { |position| position[0].between?(0,7) && position[1].between?(0,7) }
                                .reject { |position| @@history.include?(position) }
                                .map { |position| Knight.new(position, @ending, self) } 
        return next_positions
    end



    def display(node)
        display(node.parent) unless node.parent.nil?
        p node.position
    end

    def knight_moves
        queue = []
        current = Knight.new(@position, @ending, nil)
        until current.position == @ending
            current.get_next_positions.each { |position| queue.push(position) }
            current = queue.shift
        end
        display(current)
    end
end  


knight = Knight.new([1, 3] , [4, 7])
knight.knight_moves

    
