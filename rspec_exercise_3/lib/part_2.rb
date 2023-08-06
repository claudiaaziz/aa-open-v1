def element_count(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1 }
    count
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, idx|
        if hash.has_key?(char)
            str[idx] = hash[char]
        end
    end

    str
end

def product_inject(arr)
    arr.inject { |num_1, num_2| num_1 * num_2 }
end