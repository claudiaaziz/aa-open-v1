def partition(arr, num)
    less = []
    greater = []

    arr.each do |n|
        if n >= num
            greater << n
        else 
            less << n
        end
    end
    [less, greater]
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each { |k, v| new_hash[k] = v }
    hash_2.each { |k, v| new_hash[k] = v }
    new_hash
end

def censor(str, arr)
    words = str.split

    censored = words.map do |word|
        if arr.include?(word.downcase)
            censor_word(word)
        else 
            word
        end
    end

    censored.join(" ")
end

def censor_word(word)
    vowels = "aeiou"
    new_word = ""

    word.each_char do |char|
        if vowels.include?(char.downcase)
            new_word += "*"
        else
            new_word += char
        end
    end

    new_word
end

def power_of_two?(num)
    product = 1
    
    while product < num
        product *= 2
    end

    product == num
end