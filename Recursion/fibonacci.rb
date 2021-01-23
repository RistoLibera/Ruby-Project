

def fibs_rec(number, array = [0,1])
    array << array[array.length - 1].to_i + array[array.length - 2].to_i unless number < 3
    fibs_rec(number, array) if array.length < number
    return array
end

p fibs_rec(10)
p fibs_rec(1)