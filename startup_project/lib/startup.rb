require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        @funding > other_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        money_owed = @salaries[employee.title]
    
        if @funding >= money_owed
            employee.pay(money_owed)
            @funding -= money_owed
        else
            raise "not enough funding!"
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        sum = 0

        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum / (employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        # add funding
        @funding += other_startup.funding

        # merging salaries
        other_startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                salaries[title] = amount
            end
        end

        # hire employees
        @employees += other_startup.employees

        # close other startup
        other_startup.close
    end

end
