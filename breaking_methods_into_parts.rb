# how much money users child will have when they retire, based on their age.

# def return_number(a)
#       ((a / 2)**2) * (65 - (a / 2))
# end

def childs_total_retirement_funds(users_age)
    childs_age = users_age / 2
    current_bank_acc = childs_age ** 2
    yrs_til_retirement = 65 - childs_age
    current_bank_acc * yrs_til_retirement 
end

# An input of 30 should output 11250
# An input of 50 should output 25000
