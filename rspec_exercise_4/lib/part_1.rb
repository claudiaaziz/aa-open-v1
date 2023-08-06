def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    arr.count(&prc) == 1
end

def hash_select(hash, &prc)
    select = {}
    hash.each { |k, v| select[k] = v if prc.call(k, v) }
    select
end

def xor_select(arr, prc_1, prc_2)
    arr.select do |ele|
        (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))
    end
end

def proc_count(value, prcs_arr)
    prcs_arr.count { |prc| prc.call(value) }
end