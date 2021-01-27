require_relative "node.rb"

class Tree

    def initialize(array)
        @array = array.sort.uniq
        @root = build_tree(@array)
    end

    def build_tree(array)
        return nil if array.empty?
        middle = (array.length - 1) / 2
        node = Node.new(array[middle])
        node.left = build_tree(array[0...middle])
        node.right = build_tree(array[(middle+1)..-1])
        return node
    end

    def insert(value, node = @root)
        if value == node.data
            puts "Identical data exists!" 
            return
        end

        if value < node.data
            node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
        else
            node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
        end
    end

    def get_leftmost_leaf(node)
        node  = node.left until node.left.nil?
        return node
    end

    def delete(value, node = @root)
        return if node.nil?
        if value < node.data
            node.left = delete(value, node.left)
        elsif value > node.data
            node.right = delete(value, node.right)
        else
            return node.right if node.left.nil?
            return node.left if node.right.nil?

            leaf_value = get_leftmost_leaf(node.right).data
            node.data = leaf_value
            node.right = delete(leaf_value, node.right)
        end
        return node 
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def find(value)
        
    end

end


new_tree = Tree.new([2, 3, 4, 5, 10, 7, 8, 1])
new_tree.pretty_print
new_tree.insert(6)
new_tree.insert(1)
new_tree.delete(4)
new_tree.pretty_print
