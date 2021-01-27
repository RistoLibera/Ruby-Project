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
        if value < node.data
            node.left = delete(value, node.left)
        elsif value > node.data
            node.right = delete(value, node.right)
        elsif value == node.data
            return node.right if node.left.nil?
            return node.left if node.right.nil?

            leaf_value = get_leftmost_leaf(node.right).data
            node.data = leaf_value
            node.right = delete(leaf_value, node.right)
        else
            puts "Data doesn't exist."
            return
        end
        return node 
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def find(value, node = @root)
        
        if value < node.data
            node.left = find(value, node.left)
        elsif value > node.data
            node.right = find(value, node.right)
        elsif value == node.data
            puts "Node Value: #{node.data}"
            puts "Node Left: #{node.left.data}" unless node.left.nil?
            puts "Node Right: #{node.right.data}" unless node.right.nil?
            return node
        else
            p "None is found."
            return
        end
        return node
    end

    def level_order(node = @root, queue = [])
        output = []
        queue.push(node);
        until queue.empty? do
            current = queue.shift
            queue.push(current.left) if current.left
            queue.push(current.right) if current.right
            output.push(current.data)
        end
        return output

    end

    def preorder(node = @root, queue = [])
        return if node.nil?
        queue << node.data
        preorder(node.left, queue)
        preorder(node.right, queue)
        return queue
    end

    def inorder(node = @root, queue = [])
        return if node.nil?
        preorder(node.left, queue)
        queue << node.data
        preorder(node.right, queue)
        return queue
    end

    def postorder(node = @root, queue = [])
        return if node.nil?
        preorder(node.left, queue)
        preorder(node.right, queue)
        queue << node.data
        return queue
    end

end


new_tree = Tree.new([2, 3, 4, 5, 10, 7, 8, 1])
new_tree.pretty_print
new_tree.insert(13)
new_tree.delete(1)
new_tree.find(5)
new_tree.pretty_print
new_tree.level_order
p new_tree.preorder
p new_tree.inorder
p new_tree.postorder