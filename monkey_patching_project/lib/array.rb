# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min 
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        mid_idx = self.length / 2

        return nil if self.empty?
        if self.length.odd?
            return self.sort[mid_idx]
        else
            (self.sort[mid_idx] + self.sort[mid_idx - 1]) / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(value)
        count = 0
        self.each do |ele|
            count += 1 if ele == value
        end
        count
    end

    def my_index(value)
        self.each_with_index do |ele, i|
            return i if ele == value
        end

        nil
    end

    def my_uniq
        uniq = []

        self.each do |ele|
            uniq << ele if !uniq.include?(ele)
        end

        uniq
    end

    def my_transpose
        new_arr = []

        (0...self.length).each do |row|
            new_row = []
            (0...self.length).each do |col|
                new_row << self[col][row]
            end

            new_arr << new_row
        end

        new_arr
    end


end
