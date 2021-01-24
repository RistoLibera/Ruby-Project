
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

    def print_lists
        pointer = @head
        until pointer == nil do
            if pointer.next_node != nil
                print "(#{pointer.value}) => " 
            else
                print "(#{pointer.value}) => tail \n"
            end
            pointer = pointer.next_node
        end
    end

    def return_node_at(index)
        pointer = @head
        n = 1
        until pointer == nil do
            puts "Value is #{pointer.value} at position #{index}" if n == index
            pointer = pointer.next_node
            n += 1
        end
            puts "None is found" if index <= 0 || index > n
    end

    def pop
        pointer = @head
        until pointer.next_node.next_node == nil do
            pointer = pointer.next_node
        end
        pointer.next_node = nil
        @tail = nil
    end

    def insert_at(value, index)
        new_node = Node.new(value)
        pointer = @head
        n = 1
        until n == index
            pointer = pointer.next_node
            n += 1
        end
        new_node.next_node = pointer.next_node
        pointer.next_node = new_node
    end

end


list =LinkedList.new
list.append(5)
list.append(1)
list.prepend(3)
list.get_size
list.print_lists
list.return_node_at(0)
list.return_node_at(2)
list.return_node_at(10)
list.pop
list.get_size
list.print_lists
list.insert_at(11,2)
list.get_size
list.print_lists
list.insert_at(6,1)
list.get_size
list.print_lists



