def new_prod(nums,idx):
    tmp=1
    ctr=0
    while ctr<5:
        d = int(nums[idx])
        if d != 0:
            tmp = tmp * d
            ctr+=1
            idx+=1
        else:
            tmp=1
            idx+=ctr+1
            ctr=0
    x=(idx, tmp)
    return x

def f(filename):
    file = open(filename, 'r')
    nums = file.readline()
    file.close()
    idx, val = new_prod(nums,0)
    max = val
    while idx < len(nums):
        digit = int(nums[idx])
        if digit != 0:
            val = (val // int(nums[idx-5])) * digit
            idx+=1
        else:
            try:
                idx, val = new_prod(nums, idx+1)
            except IndexError:
                print("IndexError")
                break
            except ValueError:
                print("ValueError")
                break
        if val > max:
            max = val
    return max
