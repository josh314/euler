def f(max):
    """Project Euler, problem 6"""
    sum=0
    sq_sum=0
    for n in range(1,max+1):
        sum += n
        sq_sum *= n*n
    return sum*sum-sq_sum
