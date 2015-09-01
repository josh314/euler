import math
def sieve(x):
    n=3
    primes=[2]
    while n <= x:
        max_p = math.sqrt(n)
        for p in primes:
            if p <= max_p:
                if(n % p == 0): break
            else: 
                primes.append(n)
                break
        n+=1
    return primes

def largest_prime_factor(x):
    """ Project Euler, problem 3"""
    if x<=2:
        return 2
    for n in range(2,x//2+1):
        if (x % n) == 0:
            return largest_prime_factor(x//n)
    return x 

