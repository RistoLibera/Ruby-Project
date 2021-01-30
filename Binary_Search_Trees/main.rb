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

    def find(value, node = @root)
        return node if node.nil? || node.data == value
        value < node.data ? find(value, node.left) : find(value, node.right)
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

    def depth(node = @root, edges = 0)
        value = node.data
        if value < node.data
            edges += 1
            depth(node.left, edges)
            elsif value > node.data
            edges += 1
            depth(node.right, edges)
        elsif value == node.data
            return edges 
        else
            p "None is found."
            return
        end
    end

    def height(node = @root, left = 0, right = 0)
        return -1 if node.nil?
        left += 1 + height(node.left)
        right += 1 + height(node.right)
        left > right ? left : right
    end

    def balance?(node = @root, queue = [], counter = 0)
        if node.nil?
            queue << counter
            return
        end
        counter += 1
        balance?(node.left, queue, counter)
        balance?(node.right, queue, counter)
        if queue.uniq.length > 2
            return "Unbalanced"
        elsif queue.uniq.length == 2 && (queue.uniq[0] - queue.uniq[1]).abs <= 1
            return "Balanced" 
        else 
            return "Balanced" 
        end
    end

    def rebalance
        @root = build_tree(self.level_order().sort)
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
end


new_tree = Tree.new([2, 3, 4, 5, 10, 7, 8, 1])
new_tree.pretty_print
new_tree.insert(13)
new_tree.delete(1)
# new_tree.pretty_print
# p new_tree.level_order
# p new_tree.preorder
# p new_tree.inorder
# p new_tree.postorder
# a = new_tree.find(8)
# puts new_tree.height(a)
# puts new_tree.balance?
# new_tree.delete(10)
# new_tree.delete(13)
# new_tree.pretty_print
# puts new_tree.balance?
# puts ""
new_tree.pretty_print
puts new_tree.balance?
new_tree.rebalance
new_tree.pretty_print
