class GuessingGame

    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1

        if @secret_num == num
            @game_over = true
            puts "you win"
        elsif @secret_num < num
            puts "too big"
        else
            puts "too small"
        end
    end

    def ask_user
        puts "enter a number"
        check_num(gets.chomp.to_i)
    end

end
