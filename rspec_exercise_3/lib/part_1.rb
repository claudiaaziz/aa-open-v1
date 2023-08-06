def is_prime?(num)
    return false if num < 2
    (2...num).each { |divisor| return false if num % divisor == 0 }
    true
end

def nth_prime(n)
    count = 0

    num = 1
    while count < n
        num += 1
        count += 1 if is_prime?(num)
    end
    
    num
end

def prime_range(min, max)
    range = []

    (min..max).each do |num|
        range << num if is_prime?(num)
    end

    range
end