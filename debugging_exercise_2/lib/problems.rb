# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(n)
    return false if n < 2
    (2...n).none? { |divisor| n % divisor == 0 } 
end

def largest_prime_factor(num)
    num.downto(2) do |factor|
        return factor if prime?(factor) && num % factor == 0
    end
end

def unique_chars?(str)
    already_seen = []
    str.each_char do |char|
        if already_seen.include?(char)
            return false
        end
            already_seen << char
    end

    true
end

def dupe_indices(arr)
    indices = Hash.new { |h, k| h[k] = [] }

    arr.each_with_index do |ele, i|
        indices[ele] << i
    end

    indices.select { |ele, arr| arr.length > 1 }
end

def ele_count(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1 }
    count
end

def ana_array(arr_1, arr_2)
    ele_count(arr_1) == ele_count(arr_2)
end

