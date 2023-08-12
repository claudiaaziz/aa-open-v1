require_relative 'item.rb'

class List
    # print styles
    LINE_WIDTH = 49
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10
    CHECKMARK = "\u2713".force_encoding('utf-8') 

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = '')
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def toggle_item(idx)
        item = self[idx]
        item.toggle if !item.nil?
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        0 <= idx && idx < self.size
    end

    def swap(idx_1, idx_2)
        return false if !valid_index?(idx_1) || !valid_index?(idx_2)
        @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
        true
    end

    def [](idx)
        return nil if !valid_index?(idx)
        @items[idx]
    end

    def print
        puts '=' * LINE_WIDTH
        puts ' ' * 16 + self.label.upcase
        puts '=' * LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | Done"
        puts '=' * LINE_WIDTH
        @items.each_with_index do |item, i|
            status = item.done ? CHECKMARK : ' '
            puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | [#{status}]"
        end
        puts '=' * LINE_WIDTH
    end

    def print_full_item(idx)
        item = self[idx]
        return if item.nil?
        status = item.done ? CHECKMARK : ' '
        puts '=' * LINE_WIDTH
        puts "#{item.title}".ljust(LINE_WIDTH/2) + "#{item.deadline} [#{status}]".rjust(LINE_WIDTH/2)
        puts item.description
        puts '=' * LINE_WIDTH
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, amount = 1)
        return false if !valid_index?(idx)
        while amount > 0 && idx != 0
            swap(idx, idx - 1)
            idx -= 1
            amount -= 1
        end
        true
    end

    def down(idx, amount = 1)
        return false if !valid_index?(idx)
        while amount > 0 && idx != size - 1
            swap(idx, idx + 1)
            idx += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def remove_item(idx)
        return false if !valid_index?(idx)
        @items.delete_at(idx)
        true
    end

    def purge
        @items.delete_if(&:done)
    end
end