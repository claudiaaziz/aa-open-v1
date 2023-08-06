def zip(*arrays)
    length = arrays.first.length
    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| prc_1.call(ele) && !prc_2.call(ele) || !prc_1.call(ele) && prc_2.call(ele) }
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max
    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def maximum(arr, &prc)
    return nil if arr.empty?

    max = arr.first

    arr.each do |ele|
        max = ele if prc.call(ele) >= prc.call(max) 
    end

    max
end

def my_group_by(arr, &prc)
    group = Hash.new { |h, k| h[k] = [] } 

    arr.each do |ele|
        group[prc.call(ele)] << ele 
    end

    group
end

def max_tie_breaker(arr, prc_1, &prc_2)
    max = arr.first

    arr.each do |ele|
        if prc_2.call(max) < prc_2.call(ele)
            max = ele 
        elsif prc_2.call(max) == prc_2.call(ele)
            prc_1.call(max, ele)
        end
    end

    max
end

def vowel_indices(word)
    vowels = "aeiou"
    indices = []

    word.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end

    indices
end

def change_word(word)
    indices = vowel_indices(word)
    word[indices.first..indices.last]
end

def silly_syllables(sentence)
    vowels = "aeiou"
    words = sentence.split
    
    new_words = words.map do |word|
        num_vowels = vowel_indices(word).length
        if num_vowels < 2
            word
        else
            change_word(word)
        end
    end

    new_words.join(" ")
end