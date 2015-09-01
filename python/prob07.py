import math
def f(max):
    """Project Euler, problem 7"""
    primes = []
    pctr = 0
    done = False
    num = 2
    while not done:
        is_prime = True
        sqrt_num = math.sqrt(num)
        for p in primes: 
            if p < sqrt_num:
                is_prime = is_prime and (num % p != 0)
            else:
                break
        if is_prime:
            primes.append(num)
            pctr+=1
        if pctr >= max:
            done = True
        num+=1
    return primes
        
