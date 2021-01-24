
class Node
    attr_reader :value
    attr_accessor :next_node

    def initialize(value)
        @value = value
        @next_node = nil
    end
end

class LinkedList
    def initialize
        @head = nil
        @tail = nil
    end

    def prepend(value)
        new_node = Node.new(value)
        new_node.next_node = @head
        @head = new_node
    end

    def change_last_node(new_code)
        pointer = @head
        until pointer.next_node == nil do
            pointer = pointer.next_node
        end
        pointer.next_node = new_code

    end

    def append(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            @tail = new_node
            change_last_node(new_node)
        end
    end

    def get_size
        counter = 1
        pointer = @head

        until pointer.next_node == nil do
            pointer = pointer.next_node
            counter += 1
        end
        puts "The linked-lists is #{counter} long."
    end

end


list =LinkedList.new
list.append(5)
list.append(1)
list.get_size



