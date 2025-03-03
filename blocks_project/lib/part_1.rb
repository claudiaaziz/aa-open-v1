def select_even_nums(nums)
    nums.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |sub| sub.sum > 0 }
end

def aba_translate(str)
    vowels = "aeiou"
    translation = ""

    str.each_char do |char|
        if vowels.include?(char)
            translation += char + "b" + char
        else
            translation += char
        end
    end

    translation
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end