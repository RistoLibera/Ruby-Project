
def merge_sort(array)
    if array.length < 2
        array
    else
        left_array = merge_sort(array[0...(array.length / 2)])
        right_array = merge_sort(array[(array.length / 2)...array.length])
        merge_pair(left_array, right_array)
    end
end

def merge_pair(left, right, array = [])
    (left.length + right.length).times do
        if right.empty?
            array << left.shift  
        elsif left.empty?
            array << right.shift
        else
            comparison = left <=> right
            case comparison
            when -1
                array << left.shift
            when 1 
                array << right.shift
            else
                array << left.shift
            end
        end



        
    end
    array
end


def random_number_sort
    array = []
    rand(10..50).times {array << rand(1..50)}
    result = merge_sort(array)
    return result
end

p random_number_sort()


