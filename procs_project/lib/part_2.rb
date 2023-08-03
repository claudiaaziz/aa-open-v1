def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    sentence.split.map { |ele| prc.call(ele) }.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    value_1 = prc_1.call(num)
    value_2 = prc_2.call(num)

    if value_1 > value_2
        return value_1
    end

    value_2
end

def and_selector(arr, prc_1, prc_2)
    arr.select do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            ele
        end
    end
end

def alternating_mapper(arr, prc_1, prc_2)
    arr.map.with_index do |ele, i|
        if i.even? 
            prc_1.call(ele)
        else
            prc_2.call(ele)
        end
    end
end