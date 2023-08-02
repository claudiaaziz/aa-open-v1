def hipsterfy(word)
    vowels = "aeiou"

    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i + 1..-1]
        end
        i -= 1
    end

    word
end

def vowel_counts(str)
    vowels = ('aeiou')
    count = Hash.new(0)

    str.each_char do |char| 
        if vowels.include?(char.downcase)
            count[char.downcase] += 1
        end
    end

    count
end

def caesar_cipher(msg, num)
    alpha = ("a".."z").to_a
    new_msg = ""

    msg.each_char.with_index do |char, i|
        if !alpha.include?(char)
            new_msg += char
        else
            old_idx = alpha.index(char)
            new_idx = (old_idx + num) % 26
            new_msg += alpha[new_idx]
        end
    end

    new_msg
end