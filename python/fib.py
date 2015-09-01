""" Project Euler, problem 2 """

def even_sum(bound):
    sum = 0
    Fn_minus_two = 1
    Fn_minus_one = 1
    while True:
        Fn = Fn_minus_one+Fn_minus_two
        if(Fn > bound):
            break
        if(Fn % 2 == 0):
            sum += Fn
        Fn_minus_two = Fn_minus_one
        Fn_minus_one = Fn
    return sum

