class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        selects = []
        self.my_each do |ele|
            selects << ele if prc.call(ele)
        end
        selects
    end

    def my_reject(&prc)
        rejected = []
        self.my_each do |ele|
            rejected << ele if !prc.call(ele)
        end
        rejected
    end


    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end

        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        
        true
    end


    def my_flatten
        flattened = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened.concat(ele.my_flatten)
            else
                flattened << ele
            end
        end

        flattened
    end

    def my_zip(*arrays)
        zipped = []

        self.length.times do |i|
            sub_zip = [self[i]]
            arrays.my_each do |array|
                sub_zip << array[i]
            end
            zipped << sub_zip
        end

        zipped
    end

    def my_rotate(positions = 1)
        split_idx = positions % self.length
        self.drop(split_idx) + self.take(split_idx)
    end

    def my_join(seperator = '')
        join = ""
        self.length.times do |i|
            join += self[i]
            join += seperator unless i == self.length - 1
        end

        join
    end

    def my_reverse
        reverse = []
        self.my_each do |ele|
            reverse.unshift(ele)
        end
        reverse
    end
end


