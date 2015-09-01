import fractions

def lcm(multiple_list):
    """Project Euler, problem 5"""
    res = 1
    for n in multiple_list:
        if res % n != 0:
            res *= n//fractions.gcd(res,n)
    return res
