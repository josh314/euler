def is_palindrome(x):
    y = repr(x)
    for n in range(len(y)//2):
        if y[n] != y[-(n+1)]:
            return False
    return True

def largest(max):
    """Project Euler, problem 4"""
    i=max
    y = [1, 1, 1]
    while i > 1:
        j=max
        while j > 1:
            x = i*j
            if x > y[0]:
                if is_palindrome(x):
                    y[0] = x
                    y[1] = i
                    y[2] = j
            j-=1
        i-=1
    print(y)
